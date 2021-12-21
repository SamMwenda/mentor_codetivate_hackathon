import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mentor_codetivate_hackathon/Models/user_data.dart';
import 'package:mentor_codetivate_hackathon/Services/firebase.dart';
import 'package:mentor_codetivate_hackathon/Widgets/scrolling.dart';
import 'package:mentor_codetivate_hackathon/Widgets/text_styles.dart';

class EditDialog extends StatefulWidget {
  const EditDialog({Key? key}) : super(key: key);

  @override
  _EditDialogState createState() => _EditDialogState();
}

///retrieve the registered object for [FireStore]
FireStore get service => GetIt.I<FireStore>();

class _EditDialogState extends State<EditDialog> {
  late TextEditingController name = TextEditingController();
  late String image;

  @override
  Widget build(BuildContext context) {
    //height and width of device screen
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    Widget _textFormField(
        {required TextEditingController controller,
        required String hint}) {
      return Padding(
        padding: EdgeInsets.only(top: (20 / 720) * _height),
        child: Container(
          padding: EdgeInsets.all((10 / 720) * _height),
          width: _width / 100 * 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular((20 / 720) * _height),
              border: Border.all(
                width: 1.5,
                color: const Color.fromRGBO(242, 127, 12, 1.0),
              )),
          child: Column(
            children: [
              Theme(
                data: Theme.of(context).copyWith(
                    textSelectionTheme: const TextSelectionThemeData(
                        cursorColor: Colors.white,
                        selectionColor: Colors.white,
                        selectionHandleColor: Colors.white)),
                child: Center(
                  child: TextFormField(
                      controller: controller,
                      scrollPhysics: const BouncingScrollPhysics(),
                      textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.center,
                      autocorrect: false,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hoverColor: Colors.white,
                        hintText: hint,
                        hintStyle: TextStyle(
                            fontFamily: "Fugaz One",
                            fontSize: (18 / 720) * _height,
                            letterSpacing: 1.5,
                            color: Colors.white),
                      ),
                      style: TextStyle(
                          fontFamily: "Fugaz One",
                          fontSize: (18 / 720) * _height,
                          color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Dialog(
      insetAnimationCurve: Curves.easeIn,
      backgroundColor: const Color.fromRGBO(5, 63, 92, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular((60 / 720) * _height),
      ),
      child: ScrollConfiguration(
        behavior: MyCustomScrollBehavior(),
        child: StreamBuilder<DocumentSnapshot<UserModel>>(
            stream: service.listenUserData(),
            builder: (context, snapshot) {
              return Container(
                  height: _height / 100 * 70,
                  width: _width / 100 * 50,
                  padding: EdgeInsets.all((10 / 720) * _height),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular((60 / 720) * _height),
                  ),
                  child:
                      Stack(alignment: AlignmentDirectional.center, children: [
                    Opacity(
                      opacity: 0.02,
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  'assets/gui/world.png',
                                ),
                                fit: BoxFit.contain)),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Profile",
                            style: Styles.textStyleFugazOne(context,
                                size: 32, color: Colors.white)),
                        Flexible(
                          child: GridView.count(
                            padding: EdgeInsets.all((10 / 720) * _height),
                            physics: const BouncingScrollPhysics(),
                            crossAxisCount: 5,
                            children: List.generate(
                                20,
                                (index) => Padding(
                                      padding:
                                          EdgeInsets.all((20 / 720) * _height),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            image = 'assets/profiles/' +
                                                (index + 1).toString() +
                                                '.png';
                                          });
                                        },
                                        child: Container(
                                          height: _height / 100 * 10,
                                          width: _width / 100 * 10,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color.fromRGBO(
                                                159, 231, 245, 1.0),
                                          ),
                                          child: Center(
                                              child: Image(
                                                  image: AssetImage(
                                            'assets/profiles/' +
                                                (index + 1).toString() +
                                                '.png',
                                          ))),
                                        ),
                                      ),
                                    )),
                          ),
                        ),
                        _textFormField(
                            controller: name, hint: "Name"),
                        Padding(
                          padding: EdgeInsets.all((40 / 720) * _height),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                    height: _height / 100 * 9,
                                    width: _width / 100 * 20,
                                    decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            66, 158, 189, 1.0),
                                        borderRadius: BorderRadius.circular(
                                            (20 / 720) * _height)),
                                    child: Center(
                                      child: Text("cancel",
                                          style: Styles.textStyleFugazOne(
                                              context,
                                              size: 24,
                                              color: const Color.fromRGBO(
                                                  5, 63, 92, 1.0))),
                                    ),
                                  ),
                                ),
                                SizedBox(width: (10 / 720) * _height),
                                GestureDetector(
                                  onTap: () async {
                                    if (name.text.isNotEmpty &&
                                        image.isNotEmpty) {
                                      await service
                                          .updateUser(UserModel(
                                              email: FirebaseAuth
                                                  .instance.currentUser!.email!,
                                              name: name.text,
                                              image: image))
                                          .then((value) {
                                        Navigator.of(context).pop();
                                      });
                                    }
                                  },
                                  child: Container(
                                    height: _height / 100 * 9,
                                    width: _width / 100 * 20,
                                    decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            242, 127, 12, 1.0),
                                        borderRadius: BorderRadius.circular(
                                            (20 / 720) * _height)),
                                    child: Center(
                                      child: Text("save",
                                          style: Styles.textStyleFugazOne(
                                              context,
                                              size: 24,
                                              color: const Color.fromRGBO(
                                                  5, 63, 92, 1.0))),
                                    ),
                                  ),
                                ),
                              ]),
                        )
                      ],
                    )
                  ]));
            }),
      ),
    );
  }
}
