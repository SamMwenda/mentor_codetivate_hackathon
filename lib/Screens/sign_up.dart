import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mentor_codetivate_hackathon/Models/quotes_model.dart';
import 'package:mentor_codetivate_hackathon/Models/user_data.dart';
import 'package:mentor_codetivate_hackathon/Screens/profile.dart';
import 'package:mentor_codetivate_hackathon/Services/firebase.dart';
import 'package:mentor_codetivate_hackathon/Widgets/footer.dart';
import 'package:mentor_codetivate_hackathon/Widgets/header.dart';
import 'package:mentor_codetivate_hackathon/Widgets/text_styles.dart';
import 'package:mentor_codetivate_hackathon/Widgets/text_form_field.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _signIn = false;
  bool _isLoading = false;
  String textLink = "Sign In";
  String textButton = "Register";
  late TextEditingController email = TextEditingController();
  late TextEditingController password = TextEditingController();
  late TextEditingController cPassword = TextEditingController();

  ///retrieve the registered object for [FireStore]
  FireStore get service => GetIt.I<FireStore>();
  @override
  Widget build(BuildContext context) {
    //height and width of device screen
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    var _signUpContainer = Padding(
        padding: EdgeInsets.only(
            top: (30 / 720) * _height, right: (40 / 720) * _height),
        child: Container(
            height: _height / 100 * 70,
            width: _width / 100 * 40,
            padding: EdgeInsets.all(((20 / 720) * _height)),
            decoration: BoxDecoration(
                color: const Color.fromRGBO(6, 47, 68, 1.0),
                borderRadius: BorderRadius.circular((20 / 720) * _height)),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Email:",
                    style: Styles.textStyleFugazOne(context,
                        size: 18, color: Colors.white),
                  ),
                  TextFieldWidget(false, email),
                  Text(
                    "Password:",
                    style: Styles.textStyleFugazOne(context,
                        size: 18, color: Colors.white),
                  ),
                  TextFieldWidget(true, password),
                  !_signIn
                      ? Text(
                          "Confirm password:",
                          style: Styles.textStyleFugazOne(context,
                              size: 18, color: Colors.white),
                        )
                      : Container(),
                  !_signIn ? TextFieldWidget(true, cPassword) : Container(),
                  GestureDetector(
                    onTap: () async {
                      setState(() {
                        _isLoading = true;
                      });
                      //before registering we want to  checkif it is register or signUpMemberWithEmailAndPassword validate Email
                      // check also password match
                      if (textButton == 'Register') {
                        if (RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                .hasMatch(email.text) &&
                            password.text == cPassword.text) {
                          await service
                              .signUpMemberWithEmailAndPassword(
                                  email.text, password.text)
                              .then((value)async {
                            await service.createNewUser(UserModel(email: email.text),
                                FirebaseAuth.instance.currentUser!.uid);
                            setState(() {
                              _isLoading = false;
                              _signIn = true;
                              textButton = "Sign In";
                              textLink = "Register";
                            });
                          });
                        } else {
                          setState(() {
                            _isLoading = false;
                          });
                        }
                      } else {
                        if (RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                .hasMatch(email.text) &&
                            password.text.isNotEmpty) {
                          await service
                              .signInMemberWithEmailAndPassword(
                                  email.text, password.text)
                              .then((value) {
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                    transitionDuration:
                                        const Duration(milliseconds: 300),
                                    transitionsBuilder: (_,
                                        Animation<double> animation,
                                        __,
                                        Widget child) {
                                      return Opacity(
                                        opacity: animation.value,
                                        child: child,
                                      );
                                    },
                                    pageBuilder: (context, _, __) =>
                                        const ProfileScreen()));
                            setState(() {
                              _signIn = true;
                            });
                          });
                        } else {
                          setState(() {
                            _isLoading = false;
                          });
                        }
                      }
                    },
                    child: Container(
                      height: _height / 100 * 10,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(66, 158, 189, 1.0),
                          borderRadius:
                              BorderRadius.circular((20 / 720) * _height)),
                      child: Center(
                        child: !_isLoading
                            ? Text(textButton,
                                style: Styles.textStyleFugazOne(context,
                                    size: 24,
                                    color:
                                        const Color.fromRGBO(5, 63, 92, 1.0)))
                            : const CircularProgressIndicator(
                                color: Color.fromRGBO(5, 63, 92, 1.0),
                              ),
                      ),
                    ),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      "Already have an account? ",
                      style: Styles.textStylePoppins(context,
                          size: 18, color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (textLink == "Sign In") {
                            _signIn = true;
                            textLink = "Register";
                            textButton = "Sign In";
                          } else {
                            _signIn = false;
                            textLink = "Sign In";
                            textButton = "Register";
                          }
                        });
                      },
                      child: Text(
                        textLink,
                        style: Styles.textStylePoppins(context,
                            size: 18,
                            color: const Color.fromRGBO(242, 127, 12, 1.0)),
                      ),
                    ),
                  ])
                ])));

    _quotesItem(QuotesModel model) {
      return Column(
        children: [
          Text(model.quote,
              style: Styles.textStyleFugazOne(context,
                  size: 24, color: Colors.white)),
          Text(model.author,
              style: Styles.textStylePoppins(context,
                  size: 18, color: const Color.fromRGBO(242, 127, 12, 1.0))),
        ],
      );
    }

    var _quotes = Column(
      children: [
        Flexible(
          flex: 2,
          child: CarouselSlider.builder(
            itemCount: quotes.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    _quotesItem(quotes[itemIndex]),
            options: CarouselOptions(
                viewportFraction: 1,
                autoPlay: true,
                aspectRatio: 2,
                autoPlayCurve: Curves.easeIn),
          ),
        ),
        Flexible(flex: 2, child: Container()),
      ],
    );

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
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: (270 / 720) * _height, left: (80 / 720) * _height),
                    child: _quotes,
                  ),
                  _signUpContainer,
                ],
              )),
          const Align(alignment: Alignment.bottomCenter, child: Footer()),
        ],
      ),
    );
  }
}
