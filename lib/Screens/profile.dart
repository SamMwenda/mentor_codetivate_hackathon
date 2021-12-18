import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mentor_codetivate_hackathon/Widgets/footer.dart';
import 'package:mentor_codetivate_hackathon/Widgets/header.dart';
import 'package:mentor_codetivate_hackathon/Widgets/scrolling.dart';
import 'package:mentor_codetivate_hackathon/Widgets/text_styles.dart';

// ignore: use_key_in_widget_constructors
class ProfileScreen extends StatelessWidget {
  final ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    //height and width of device screen
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    List<String> _skillsItem = [
      "Flutter",
      "Django",
      "SQL",
      "Java",
      "Data Science"
    ];
    List<String> _hobbiesItem = [
      "Netflix",
      "Soccer",
      "Video games",
      "Coding",
    ];
    List<String> _intrestItem = [
      "Machine Learning",
      "IoT",
      "Robotics",
      "Blockchain",
    ];
    List<String> _talentsItem = [
      "Cooking",
      "Writing",
      "Drawing",
    ];
    List<String> _languagesItem = [
      "Kiswahili",
      "English",
    ];
    _socialMedia(String image) {
      return Container(
        height: _height / 100 * 10,
        width: _width / 100 * 2,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  image,
                ),
                fit: BoxFit.contain)),
      );
    }

    var _space = SizedBox(width: (8 / 720) * _width);

    ///includes name,career email and socials and edit button
    var _title = Padding(
      padding: EdgeInsets.only(left: (40 / 720) * _height),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Sammy Mwenda',
                  style: Styles.textStyleFugazOne(context,
                      size: 20, color: Colors.white)),
              Text('Software Engineer',
                  style: Styles.textStylePoppins(context,
                      size: 16, color: Colors.white)),
              Text('skmwenda47@gmail.com',
                  style: Styles.textStylePoppins(context,
                      size: 16, color: Colors.white))
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text('Social Media',
                      style: Styles.textStylePoppins(context,
                          size: 16, color: Colors.white)),
                  SizedBox(width: (30 / 720) * _width),
                  _socialMedia('assets/gui/github.png'),
                  _space,
                  _socialMedia('assets/gui/linkedin.png'),
                  _space,
                  _socialMedia('assets/gui/medium.png'),
                  _space,
                  _socialMedia('assets/gui/facebook.png'),
                  _space,
                  _socialMedia('assets/gui/instagram.png'),
                  _space,
                  _socialMedia('assets/gui/twitter.png'),
                ],
              ),
              Container(
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
              SizedBox(height: (25 / 720) * _height)
            ],
          )
        ],
      ),
    );

    /// about me container
    var _aboutMe = Container(
        height: _height / 100 * 35,
        width: _width / 100 * 25,
        padding: EdgeInsets.all(((10 / 720) * _height)),
        decoration: BoxDecoration(
            color: const Color.fromRGBO(242, 127, 12, 1.0),
            borderRadius: BorderRadius.circular((20 / 720) * _height)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "About Me",
              style: Styles.textStyleFugazOne(context,
                  size: 18, color: const Color.fromRGBO(5, 63, 92, 1.0)),
            ),
            Text(
              "Am a flutter developer. I love coding mostly mobile development. Am a 2nd year student at KCA University undertaking a BSc in Applied computing I am the founder and CEO of Nisa technologies ",
              style: Styles.textStylePoppins(context,
                  size: 14, color: const Color.fromRGBO(5, 63, 92, 1.0)),
            )
          ],
        ));

    /// add skill items into a list widgets
    List<Widget> _skillsWidgetList() {
      List<Widget> _skills = [];
      for (int i = 0; i < _skillsItem.length; i++) {
        var widget = Container(
          height: _height / 100 * 5,
          padding: EdgeInsets.all(((10 / 720) * _height)),
          decoration: BoxDecoration(
              color: const Color.fromRGBO(247, 173, 25, 1.0),
              borderRadius: BorderRadius.circular((20 / 720) * _height)),
          child: Center(
            child: Text(_skillsItem[i],
                style: Styles.textStylePoppins(context,
                    size: 12, color: const Color.fromRGBO(5, 63, 92, 1.0))),
          ),
        );
        _skills.add(widget);
      }
      return _skills;
    }

    var _skills = Container(
      height: _height / 100 * 16,
      width: _width / 100 * 20,
      padding: EdgeInsets.all(((10 / 720) * _height)),
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            width: 2,
            color: const Color.fromRGBO(247, 173, 25, 1.0),
          ),
          borderRadius: BorderRadius.circular((20 / 720) * _height)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Skills",
            style: Styles.textStyleFugazOne(context,
                size: 18, color: Colors.white),
          ),
          ScrollConfiguration(
            behavior: MyCustomScrollBehavior(),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: controller,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: _skillsWidgetList(),
              ),
            ),
          ),
        ],
      ),
    );

    var _languages = Container(
      height: _height / 100 * 16,
      width: _width / 100 * 10,
      padding: EdgeInsets.all(((10 / 720) * _height)),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(159, 231, 245, 1.0),
          borderRadius: BorderRadius.circular((20 / 720) * _height)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Languages",
          style: Styles.textStyleFugazOne(context,
              size: 18, color: const Color.fromRGBO(5, 63, 92, 1.0)),
        ),
        Builder(
          builder: (context) {
            List<Widget> widgets = [];
            for (int i = 0; i < _languagesItem.length; i++) {
              Widget widget = Text(_languagesItem[i],
                  style: Styles.textStylePoppins(context,
                      size: 12, color: const Color.fromRGBO(5, 63, 92, 1.0)));
              widgets.add(widget);
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widgets,
            );
          },
        )
      ]),
    );
    var _hobbiesIntrestsTalents = Container(
      height: _height / 100 * 18,
      width: _width / 100 * 30.5,
      padding: EdgeInsets.all(((10 / 720) * _height)),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(66, 158, 189, 1.0),
          borderRadius: BorderRadius.circular((20 / 720) * _height)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Hobbies",
              style: Styles.textStyleFugazOne(context,
                  size: 18, color: const Color.fromRGBO(5, 63, 92, 1.0)),
            ),
            Builder(
              builder: (context) {
                List<Widget> widgets = [];
                for (int i = 0; i < _hobbiesItem.length; i++) {
                  Widget widget = Text(_hobbiesItem[i],
                      style: Styles.textStylePoppins(context,
                          size: 12,
                          color: const Color.fromRGBO(5, 63, 92, 1.0)));
                  widgets.add(widget);
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widgets,
                );
              },
            )
          ]),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Intrests",
              style: Styles.textStyleFugazOne(context,
                  size: 18, color: const Color.fromRGBO(5, 63, 92, 1.0)),
            ),
            Builder(
              builder: (context) {
                List<Widget> widgets = [];
                for (int i = 0; i < _intrestItem.length; i++) {
                  Widget widget = Text(_intrestItem[i],
                      style: Styles.textStylePoppins(context,
                          size: 12,
                          color: const Color.fromRGBO(5, 63, 92, 1.0)));
                  widgets.add(widget);
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widgets,
                );
              },
            )
          ]),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Talents",
              style: Styles.textStyleFugazOne(context,
                  size: 18, color: const Color.fromRGBO(5, 63, 92, 1.0)),
            ),
            Builder(
              builder: (context) {
                List<Widget> widgets = [];
                for (int i = 0; i < _talentsItem.length; i++) {
                  Widget widget = Text(_talentsItem[i],
                      style: Styles.textStylePoppins(context,
                          size: 12,
                          color: const Color.fromRGBO(5, 63, 92, 1.0)));
                  widgets.add(widget);
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widgets,
                );
              },
            )
          ]),
        ],
      ),
    );

    _recentItem(int image) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: _height / 100 * 15,
            width: _width / 100 * 15,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(159, 231, 245, 1.0),
            ),
            child: Center(
              child: CachedNetworkImage(
                imageUrl: 'gs://mentor-5e2d9.appspot.com/profile/' +
                    image.toString() +
                    '.png',
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error, color: Colors.white),
                fadeOutDuration: const Duration(seconds: 1),
                fadeInDuration: const Duration(seconds: 3),
              ),
            ),
          ),
        ],
      );
    }

    var _recent = ScrollConfiguration(
        behavior: MyCustomScrollBehavior(),
        child: ListView.builder(
            controller: controller,
            itemCount: 4,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return _recentItem(0);
            }));

    return Scaffold(
        backgroundColor: const Color.fromRGBO(5, 63, 92, 1.0),
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
            Padding(
              padding: EdgeInsets.only(
                  top: ((180 / 720) * _height), left: (70 / 720) * _width),
              child: Row(children: [
                Container(
                  padding: EdgeInsets.all(((20 / 720) * _height)),
                  height: _height / 100 * 60,
                  width: _width / 100 * 60,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular((20 / 720) * _height),
                      border: Border.all(
                        width: 2,
                        color: const Color.fromRGBO(66, 158, 189, 1.0),
                      )),
                  child: Column(
                    children: [
                      _title,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _aboutMe,
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      _skills,
                                      SizedBox(width: (4 / 720) * _width),
                                      _languages,
                                    ]),
                                SizedBox(height: (5 / 720) * _height),
                                _hobbiesIntrestsTalents
                              ])
                        ],
                      )
                    ],
                  ),
                ),
                
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: (150 / 720) * _height, left: (15 / 720) * _width),
              child: Container(
                height: _height / 100 * 15,
                width: _width / 100 * 15,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(159, 231, 245, 1.0),
                ),
                child: Center(
                  child: CachedNetworkImage(
                    imageUrl: 'gs://mentor-5e2d9.appspot.com/profile/10.png',
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error, color: Colors.white),
                    fadeOutDuration: const Duration(seconds: 1),
                    fadeInDuration: const Duration(seconds: 3),
                  ),
                ),
              ),
            ),
            const Align(alignment: Alignment.bottomCenter, child: Footer()),
          ],
        ));
  }
}
