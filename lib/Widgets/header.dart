import 'package:flutter/material.dart';
import 'package:mentor_codetivate_hackathon/Screens/find_a_mentor.dart';
import 'package:mentor_codetivate_hackathon/Screens/profile.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  //text color that changes on hover
  Color profile = Colors.white;
  Color findMentor = Colors.white;
  Color findMentee = Colors.white;
  Color beMentor = Colors.white;

  @override
  Widget build(BuildContext context) {
    //height and width of device screen
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    //navigation buttons to different pages
    _menuNavigation(String text, {required Color color}) {
      return GestureDetector(
        onTap: () {
          if (text == "Profile") {
            Navigator.push(
                context,
                PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 300),
                    transitionsBuilder:
                        (_, Animation<double> animation, __, Widget child) {
                      return Opacity(
                        opacity: animation.value,
                        child: child,
                      );
                    },
                    pageBuilder: (context, _, __) => ProfileScreen()));
          } else if (text == "Find a mentor") {
            Navigator.push(
                context,
                PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 300),
                    transitionsBuilder:
                        (_, Animation<double> animation, __, Widget child) {
                      return Opacity(
                        opacity: animation.value,
                        child: child,
                      );
                    },
                    pageBuilder: (context, _, __) => const FindMentorScreen()));
          }
        },
        child: MouseRegion(
          onHover: (event) {
            if (text == "Profile") {
              setState(() {
                profile = const Color.fromRGBO(159, 231, 245, 1.0);
              });
            } else if (text == "Find a mentor") {
              setState(() {
                findMentor = const Color.fromRGBO(159, 231, 245, 1.0);
              });
            } else if (text == "Find a mentee") {
              setState(() {
                findMentee = const Color.fromRGBO(159, 231, 245, 1.0);
              });
            } else if (text == "Be a mentor") {
              setState(() {
                beMentor = const Color.fromRGBO(159, 231, 245, 1.0);
              });
            }
          },
          onExit: (event) {
            setState(() {
              profile = Colors.white;
              findMentor = Colors.white;
              findMentee = Colors.white;
              beMentor = Colors.white;
            });
          },
          child: Text(
            text,
            style: TextStyle(
                color: color,
                fontFamily: 'Fugaz One',
                fontSize: (18 / 720) * _height),
          ),
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.only(
          top: (15 / 720) * _height, left: (20 / 720) * _height),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: _height / 100 * 15,
            width: _width / 100 * 10,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/gui/logo.png',
                    ),
                    fit: BoxFit.contain)),
          ),
          _menuNavigation('Profile', color: profile),
          _menuNavigation('Find a mentor', color: findMentor),
          _menuNavigation('Find a mentee', color: findMentee),
          _menuNavigation('Be a mentor', color: beMentor),
          SizedBox(
            width: _width / 100 * 20,
          )
        ],
      ),
    );
  }
}
