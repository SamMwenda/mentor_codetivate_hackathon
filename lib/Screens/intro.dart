import 'package:flutter/material.dart';
import 'package:mentor_codetivate_hackathon/Screens/sign_up.dart';
import 'package:mentor_codetivate_hackathon/Widgets/footer.dart';
import 'package:mentor_codetivate_hackathon/Widgets/header.dart';
import 'package:mentor_codetivate_hackathon/Widgets/text_styles.dart';

///Flutter web App that creates the material app with
///theme and a page that will be initially built page
class MentorWebApp extends StatelessWidget {
  const MentorWebApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mentor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const IntroPage(),
    );
  }
}

///The page is the default screen if the user has not logged in
class IntroPage extends StatefulWidget {
  const IntroPage({
    Key? key,
  }) : super(key: key);
  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  
  // change color of join the community button on hover
  Color hoverColor = const Color.fromRGBO(247, 173, 25, 1.0);
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
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.all(((20 / 720) * _height)),
              child: Container(
                height: _height / 100 * 70,
                width: _width / 100 * 60,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/gui/intro_image.png',
                        ),
                        fit: BoxFit.contain)),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(alignment: Alignment.topLeft, child: Header()),
              Padding(
                padding: EdgeInsets.only(top: (40 / 720) * _height),
                child: Container(
                    height: _height / 100 * 15,
                    width: _width / 100 * 15,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(
                          width: 4,
                          color: const Color.fromRGBO(247, 173, 25, 1.0),
                        ))),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: (40 / 720) * _height, left: (60 / 720) * _height),
                child: Row(
                  children: [
                    Text(
                      'Become or find a ',
                      style: Styles.textStyleFugazOne(context,size: 38, color: Colors.white),
                    ),
                    Text(
                      'mentor',
                      style: Styles.textStyleFugazOne(context,
                          size: 36,
                          color: const Color.fromRGBO(247, 173, 25, 1.0)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: (5 / 720) * _height, left: (60 / 720) * _height),
                child: Text(
                  'Help shape up the future\nBe a mentor for  innovators and leaders  of the future.',
                  style: Styles.textStyleFugazOne(context,size: 20, color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: (40 / 720) * _height, left: (60 / 720) * _height),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            transitionDuration:
                                const Duration(milliseconds: 300),
                            transitionsBuilder: (_, Animation<double> animation,
                                __, Widget child) {
                              return Opacity(
                                opacity: animation.value,
                                child: child,
                              );
                            },
                            pageBuilder: (context, _, __) => const SignUpPage()));
                  },
                  child: MouseRegion(
                    onHover: (event) {
                      setState(() {
                        hoverColor = const Color.fromRGBO(159, 231, 245, 1.0);
                      });
                    },
                    onExit: (event) {
                      setState(() {
                        hoverColor = const Color.fromRGBO(247, 173, 25, 1.0);
                      });
                    },
                    child: Container(
                      height: _height / 100 * 9,
                      width: _width / 100 * 20,
                      decoration: BoxDecoration(
                          color: hoverColor,
                          borderRadius:
                              BorderRadius.circular((20 / 720) * _height)),
                      child: Center(
                        child: Text("Join the community",
                            style: Styles.textStyleFugazOne(context,
                                size: 24,
                                color: const Color.fromRGBO(5, 63, 92, 1.0))),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Align(alignment: Alignment.bottomCenter, child: Footer()),
        ],
      ),
    );
  }
}
