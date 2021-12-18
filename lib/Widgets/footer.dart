import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mentor_codetivate_hackathon/Widgets/text_styles.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //height and width of device screen
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    _socialButtons(IconData icon) {
      return GestureDetector(
          onTap: () {}, child: Icon(icon, color: Colors.white));
    }

    var space = SizedBox(width: (20 / 720) * _width);

    return Container(
      color: const Color.fromRGBO(6, 47, 68, 1.0),
      height: _height / 100 * 7,
      width: _width,
      child: Padding(
        padding: EdgeInsets.only(left: (60 / 720) * _height),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("\u00a92021 Mentors. All rights reserved",
              style: Styles.textStyleFugazOne(context, size: 16, color: Colors.white)),
          Text("Developed by Sammy Mwenda",
              style: Styles.textStyleFugazOne(context, size: 16, color: Colors.white)),
          Row(
            children: [
              _socialButtons(FontAwesomeIcons.github),
              space,
              _socialButtons(FontAwesomeIcons.medium),
              space,
              _socialButtons(FontAwesomeIcons.twitter),
              space,
              _socialButtons(FontAwesomeIcons.facebook),
              space,
              _socialButtons(FontAwesomeIcons.instagram),
              space
            ],
          )
        ]),
      ),
    );
  }
}
