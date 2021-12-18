import 'dart:html';

import 'package:flutter/material.dart';
import 'package:mentor_codetivate_hackathon/Widgets/find_a_mentor_mentee.dart';
import 'package:mentor_codetivate_hackathon/Widgets/footer.dart';
import 'package:mentor_codetivate_hackathon/Widgets/header.dart';
import 'package:mentor_codetivate_hackathon/Widgets/search_text_widget.dart';
import 'package:mentor_codetivate_hackathon/Widgets/text_styles.dart';

class FindMentorScreen extends StatefulWidget {
  const FindMentorScreen({Key? key}) : super(key: key);

  @override
  _FindMentorScreenState createState() => _FindMentorScreenState();
}

class _FindMentorScreenState extends State<FindMentorScreen> {
  @override
  Widget build(BuildContext context) {
    //height and width of device screen
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(5, 63, 92, 1.0),
      // a stack will allow building elements on top of each other
      body: Stack(
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
          Align(
              alignment: Alignment.center,
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.only(top: (120 / 720) * _height),
                  child: const SearchTextWidget(),
                ),
                Padding(
                  padding: EdgeInsets.all((10 / 720) * _height),
                  child: Text(
                    "Mentors",
                    style: Styles.textStyleFugazOne(context,
                        size: 32, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all((10 / 720) * _height),
                  child: const FindMentorMenteeItem(
                      Color.fromRGBO(159, 231, 245, 1.0)),
                )
              ])),
          const Align(alignment: Alignment.bottomCenter, child: Footer()),
        ],
      ),
    );
  }
}
