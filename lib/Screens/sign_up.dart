import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mentor_codetivate_hackathon/Models/quotes_model.dart';
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
                  TextFieldWidget(false),
                  Text(
                    "Password:",
                    style: Styles.textStyleFugazOne(context,
                        size: 18, color: Colors.white),
                  ),
                  TextFieldWidget(true),
                  Text(
                    "Confirm password:",
                    style: Styles.textStyleFugazOne(context,
                        size: 18, color: Colors.white),
                  ),
                  TextFieldWidget(true),
                  Container(
                    height: _height / 100 * 10,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(66, 158, 189, 1.0),
                        borderRadius:
                            BorderRadius.circular((20 / 720) * _height)),
                    child: Center(
                      child: Text("Register",
                          style: Styles.textStyleFugazOne(context,
                              size: 24,
                              color: const Color.fromRGBO(5, 63, 92, 1.0))),
                    ),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      "Already have an account? ",
                      style: Styles.textStylePoppins(context,
                          size: 18, color: Colors.white),
                    ),
                    Text(
                      "Sign in",
                      style: Styles.textStylePoppins(context,
                          size: 18,
                          color: const Color.fromRGBO(242, 127, 12, 1.0)),
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
          flex:2,
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
        Flexible(
          flex: 2,
          child: Row(
            children: [
              const Icon(FontAwesomeIcons.exclamationTriangle,
                  color: Colors.redAccent),
              SizedBox(width: (20 / 720) * _height),
              Container(
                height: _height / 100 * 10,
                padding: EdgeInsets.all(((10 / 720) * _height)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular((20 / 720) * _height),
                  border: Border.all(width: 1.5, color: Colors.redAccent),
                ),
                child: Text(
                    "The site is under construction.\nPress register or sign in to continue",
                    style: Styles.textStylePoppins(context,
                        size: 14, color: Colors.redAccent)),
              ),
            ],
          ),
        ),
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
