import 'package:flutter/material.dart';
import 'package:mentor_codetivate_hackathon/Models/mentee.dart';
import 'package:mentor_codetivate_hackathon/Models/mentors.dart';
import 'package:mentor_codetivate_hackathon/Widgets/text_styles.dart';

class FindMentorMenteeItem extends StatelessWidget {
  const FindMentorMenteeItem({Key? key, this.mentor, this.mentee})
      : super(key: key);
  final Mentor? mentor;
  final Mentee? mentee;

  @override
  Widget build(BuildContext context) {
    //height and width of device screen
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Stack(children: [
      Padding(
        padding: EdgeInsets.only(top: (100 / 720) * _height),
        child: Container(
          height: _height / 100 * 20,
          width: _width / 100 * 20,
          padding: EdgeInsets.all(((10 / 720) * _height)),
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                width: 2,
                color: mentor == null ? mentee!.color : mentor!.color,
              ),
              borderRadius: BorderRadius.circular((20 / 720) * _height)),
          child: Column(children: [
            Padding(
              padding: EdgeInsets.only(top: (35 / 720) * _height),
              child: Text(mentor == null ? mentee!.name : mentor!.name,
                  style: Styles.textStyleFugazOne(context,
                      size: 18, color: Colors.white)),
            ),
            Padding(
              padding: EdgeInsets.all((10 / 720) * _height),
              child: Text(mentor == null ? mentee!.carrer : mentor!.carrer,
                  style: Styles.textStylePoppins(context,
                      size: 18, color: Colors.white)),
            )
          ]),
        ),
      ),
      Container(
        height: _height / 100 * 20,
        width: _width / 100 * 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: mentor == null ? mentee!.color : mentor!.color,
        ),
        child: Center(
          child: Center(
              child: Image(
                  image: AssetImage(
            mentor == null ? mentee!.image : mentor!.image,
          ))),
        ),
      ),
    ]);
  }
}
