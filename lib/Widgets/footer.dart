import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mentor_codetivate_hackathon/Widgets/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

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
              style: Styles.textStyleFugazOne(context,
                  size: 16, color: Colors.white)),
          Text("Developed by Sammy Mwenda",
              style: Styles.textStyleFugazOne(context,
                  size: 16, color: Colors.white)),
          Row(
            children: [
              InkWell(
                  onTap: () async {
                    await launch("https://github.com/thatguyskullie");
                  },
                  child: _socialButtons(FontAwesomeIcons.github)),
              space,
              InkWell(
                  onTap: () async {
                    await launch("https://medium.com/@thatGuySkullie");
                  },
                  child: _socialButtons(FontAwesomeIcons.medium)),
              space,
              InkWell(
                  onTap: () async {
                    await launch("https://twitter.com/NisaTechnologi3");
                  },
                  child: _socialButtons(FontAwesomeIcons.twitter)),
              space,
              InkWell(
                  onTap: () async {
                    await launch(
                        "https://www.facebook.com/profile.php?id=100067944046429");
                  },
                  child: _socialButtons(FontAwesomeIcons.facebook)),
              space,
              InkWell(
                  onTap: () async {
                    await launch(
                        "https://www.instagram.com/nisa_technologies/");
                  },
                  child: _socialButtons(FontAwesomeIcons.instagram)),
              space
            ],
          )
        ]),
      ),
    );
  }
}
