import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mentor_codetivate_hackathon/Models/program.dart';
import 'package:mentor_codetivate_hackathon/Models/schedule.dart';
import 'package:mentor_codetivate_hackathon/Models/user_data.dart';
import 'package:mentor_codetivate_hackathon/Widgets/edit_dialog.dart';
import 'package:mentor_codetivate_hackathon/Widgets/footer.dart';
import 'package:mentor_codetivate_hackathon/Widgets/header.dart';
import 'package:mentor_codetivate_hackathon/Widgets/text_styles.dart';

// ignore: use_key_in_widget_constructors
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ScrollController controller = ScrollController();
  TextEditingController programName = TextEditingController();
  TextEditingController scheduleTitle = TextEditingController();
  TextEditingController venue = TextEditingController();
  late DateTime selectedDate = DateTime.now();
  List<Schedule> schedule = [];
  bool _dialogOpen = false;
  bool program = false;
  bool calendar = true;
  final double _sigmaX = 0.001; // from 0-10
  final double _sigmaY = 0.001; // from 0-10

  @override
  Widget build(BuildContext context) {
    //height and width of device screen
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    Widget _textFormField(
        {required TextEditingController controller, required String hint}) {
      return Padding(
        padding: EdgeInsets.only(top: (20 / 720) * _height),
        child: Container(
          padding: EdgeInsets.all((10 / 720) * _height),
          width: _width / 100 * 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular((20 / 720) * _height),
              border: Border.all(
                width: 1.5,
                color: const Color.fromRGBO(66, 158, 189, 1.0),
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

    _title(String name, String email) {
      return Padding(
        padding: EdgeInsets.only(left: (40 / 720) * _height),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: Styles.textStyleFugazOne(context,
                        size: 20, color: Colors.white)),
                Text(email,
                    style: Styles.textStylePoppins(context,
                        size: 16, color: Colors.white)),
                SizedBox(height: (10 / 720) * _height),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _dialogOpen = true;
                    });
                    showDialog(
                        context: context,
                        barrierColor: Colors.transparent,
                        barrierDismissible: false,
                        builder: (context) {
                          return const EditDialog();
                        }).then((value) {
                      setState(() {
                        _dialogOpen = false;
                      });
                    });
                  },
                  child: Container(
                    height: _height / 100 * 5,
                    width: _width / 100 * 6,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                          width: 1,
                          color: const Color.fromRGBO(66, 158, 189, 1.0),
                        )),
                    child: Center(
                        child: Text("Edit",
                            style: Styles.textStylePoppins(context,
                                size: 12, color: Colors.white))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: (20 / 720) * _height, bottom: (10 / 720) * _height),
                  child: Text("Programs",
                      style: Styles.textStyleFugazOne(context,
                          size: 18, color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
        backgroundColor: const Color.fromRGBO(5, 63, 92, 1.0),
        body: StreamBuilder<DocumentSnapshot<UserModel>>(
            stream: service.listenUserData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Stack(
                  children: [
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
                    const Align(alignment: Alignment.topLeft, child: Header()),
                    Padding(
                      padding: EdgeInsets.only(
                          top: ((120 / 720) * _height),
                          left: (70 / 720) * _width),
                      child: Row(children: [
                        Container(
                            padding: EdgeInsets.all(((20 / 720) * _height)),
                            height: _height / 100 * 60,
                            width: _width / 100 * 40,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius:
                                    BorderRadius.circular((20 / 720) * _height),
                                border: Border.all(
                                  width: 2,
                                  color:
                                      const Color.fromRGBO(66, 158, 189, 1.0),
                                )),
                            child: Column(
                              children: [
                                _title(
                                  snapshot.data!.data()!.name ?? "Enter name",
                                  snapshot.data!.data()!.email,
                                ),
                                Flexible(
                                  child: ListView.builder(
                                      itemCount: programList.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.all(
                                              (5 / 720) * _height),
                                          child: Container(
                                            height: _height / 100 * 15,
                                            width: _width / 100 * 15,
                                            decoration: BoxDecoration(
                                                color: const Color.fromRGBO(
                                                    242, 127, 12, 1.0),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        (20 / 720) * _height)),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: _height / 100 * 10,
                                                  width: _width / 100 * 10,
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color.fromRGBO(
                                                        159, 231, 245, 1.0),
                                                  ),
                                                  child: Center(
                                                      child: Image(
                                                          height:
                                                              _height / 100 * 5,
                                                          width:
                                                              _width / 100 * 5,
                                                          image: AssetImage(
                                                            programList[index]
                                                                .image,
                                                          ))),
                                                ),
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                        programList[index].name,
                                                        style: Styles
                                                            .textStyleFugazOne(
                                                                context,
                                                                size: 18,
                                                                color: const Color
                                                                        .fromRGBO(
                                                                    5,
                                                                    63,
                                                                    92,
                                                                    1.0))),
                                                  
                                                    Text(
                                                        "by " +
                                                            programList[index]
                                                                .publisher,
                                                        style: Styles
                                                            .textStylePoppins(
                                                                context,
                                                                size: 18,
                                                                color: const Color
                                                                        .fromRGBO(
                                                                    5,
                                                                    63,
                                                                    92,
                                                                    1.0))),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                )
                              ],
                            )),
                        Padding(
                          padding: EdgeInsets.only(left: (30 / 720) * _width),
                          child: Column(children: [
                            _textFormField(
                                controller: programName, hint: "Program name"),
                            _textFormField(
                                controller: scheduleTitle, hint: "Title"),
                            _textFormField(controller: venue, hint: "Venue"),
                            Padding(
                              padding: EdgeInsets.all((20 / 720) * _height),
                              child: GestureDetector(
                                onTap: () async {
                                  if (scheduleTitle.text.isNotEmpty &&
                                      venue.text.isNotEmpty) {
                                    await showDatePicker(
                                      context: context,
                                      initialDate: selectedDate,
                                      firstDate: DateTime(2020),
                                      lastDate: DateTime(2030),
                                    ).then((value) {
                                      if (value != null) {
                                        var dateFormat =
                                            DateFormat('yyyy-MM-dd HH:mm:ss');
                                        String formattedDate =
                                            dateFormat.format(value);
                                        schedule.add(Schedule(
                                            date: formattedDate,
                                            title: scheduleTitle.text,
                                            venue: venue.text));
                                        venue.clear();
                                        scheduleTitle.clear();
                                      }
                                    });
                                  }
                                },
                                child: Container(
                                  height: _height / 100 * 5,
                                  width: _width / 100 * 8,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                        width: 1,
                                        color: const Color.fromRGBO(
                                            66, 158, 189, 1.0),
                                      )),
                                  child: Center(
                                      child: Text("Add Schedule",
                                          style: Styles.textStylePoppins(
                                              context,
                                              size: 12,
                                              color: Colors.white))),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                if (programName.text.isNotEmpty) {}
                              },
                              child: Container(
                                height: _height / 100 * 9,
                                width: _width / 100 * 20,
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(66, 158, 189, 1.0),
                                    borderRadius: BorderRadius.circular(
                                        (20 / 720) * _height)),
                                child: Center(
                                  child: Text("Add program",
                                      style: Styles.textStyleFugazOne(context,
                                          size: 24,
                                          color: const Color.fromRGBO(
                                              5, 63, 92, 1.0))),
                                ),
                              ),
                            ),
                          ]),
                        )
                      ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: (150 / 720) * _height,
                          left: (15 / 720) * _width),
                      child: Container(
                        height: _height / 100 * 15,
                        width: _width / 100 * 15,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(159, 231, 245, 1.0),
                        ),
                        child: Center(
                            child: Image(
                                image: AssetImage(
                          snapshot.data!.data()!.image ?? "",
                        ))),
                      ),
                    ),
                    const Align(
                        alignment: Alignment.bottomCenter, child: Footer()),
                    _dialogOpen
                        ? BackdropFilter(
                            filter: ImageFilter.blur(
                                sigmaX: _sigmaX, sigmaY: _sigmaY),
                            child: Container(
                              color: const Color.fromRGBO(5, 63, 92, 0.9),
                            ),
                          )
                        : const Text('')
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              }
            }));
  }
}
