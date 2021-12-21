import 'package:flutter/material.dart';
import 'package:mentor_codetivate_hackathon/Widgets/footer.dart';
import 'package:mentor_codetivate_hackathon/Widgets/header.dart';
import 'package:mentor_codetivate_hackathon/Widgets/text_styles.dart';

class BeAMentor extends StatelessWidget {
  const BeAMentor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //height and width of device screen
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: const Color.fromRGBO(5, 63, 92, 1.0),
        body: Stack(children: [
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
            padding: EdgeInsets.only(left: (220 / 720) * _height),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                padding: EdgeInsets.all((10 / 720) * _height),
                width: _width / 100 * 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular((20 / 720) * _height),
                    border: Border.all(
                      width: 1.5,
                      color: const Color.fromRGBO(242, 127, 12, 1.0),
                    )),
                child: Theme(
                  data: Theme.of(context).copyWith(
                      textSelectionTheme: const TextSelectionThemeData(
                          cursorColor: Colors.white,
                          selectionColor: Colors.white,
                          selectionHandleColor: Colors.white)),
                  child: Center(
                    child: TextFormField(
                        scrollPhysics: const BouncingScrollPhysics(),
                        textAlign: TextAlign.start,
                        textAlignVertical: TextAlignVertical.center,
                        autocorrect: false,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          hintText: "Enter email",
                          hintStyle: TextStyle(
                              fontFamily: "Fugaz One",
                              fontSize: (24 / 720) * _height,
                              letterSpacing: 1.5,
                              color: Colors.white),
                          contentPadding: EdgeInsets.zero,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hoverColor: Colors.white,
                        ),
                        style: TextStyle(
                            fontFamily: "Fugaz One",
                            fontSize: (18 / 720) * _height,
                            color: Colors.white)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: (40 / 720) * _height, left: (60 / 720) * _height),
                child: Container(
                  height: _height / 100 * 9,
                  width: _width / 100 * 15,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(66, 158, 189, 1.0),
                      borderRadius:
                          BorderRadius.circular((20 / 720) * _height)),
                  child: Center(
                    child: Text("Apply",
                        style: Styles.textStyleFugazOne(context,
                            size: 24,
                            color: const Color.fromRGBO(5, 63, 92, 1.0))),
                  ),
                ),
              ),
            ]),
          ),
          const Align(alignment: Alignment.bottomCenter, child: Footer()),
        ]));
  }
}
