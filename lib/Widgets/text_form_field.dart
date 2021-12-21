import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatelessWidget {
  bool obscureText = false;
  TextEditingController controller;
  TextFieldWidget(this.obscureText, this.controller,{Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //height and width of device screen
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all((10 / 720) * _height),
      width: _width / 100 * 70,
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
                  obscureText: obscureText,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                        fontFamily: "Fugaz One",
                        fontSize: (18 / 720) * _height,
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
        ],
      ),
    );
  }
}
