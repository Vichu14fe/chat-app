import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'loginScreen.dart';
import 'package:privacy/RegistrationScreen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:privacy/Buttons.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    animation =
        ColorTween(begin: Colors.blue, end: Colors.white).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
      print(animation.value);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Hero(
                    tag: 'logo',
                    child: Container(
                      child: Image.asset('images/logo.png'),
                      height: 60.0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 52, 40, 0),
                  child: ColorizeAnimatedTextKit(
                    text: ['PRIVACY'],
                    colors: [
                      Colors.blue,
                      Colors.purple,
                      Colors.white,
                      Colors.yellow
                    ],
                    textStyle: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 480.0,
            ),
            Expanded(
              child: Roundbuttons(
                  title: 'Log In',
                  colour: Colors.lightBlue,
                  onpress: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  }),
            ),
            Expanded(
              child: Container(
                child: Roundbuttons(
                    title: 'Register',
                    colour: Colors.blue.shade700,
                    onpress: () {
                      Navigator.pushNamed(context, RegistrationScreen.id);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
