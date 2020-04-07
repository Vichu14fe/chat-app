import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'inputFiled.dart';
import 'package:privacy/Buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chatScreen.dart';
class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool LoadingSpinner=false;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: LoadingSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag:'logo',
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 60.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                 email = value;
                },
                decoration: kinputfield.copyWith(hintText:'Enter Your Email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                decoration: kinputfield.copyWith(hintText:'Enter Your Password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              Roundbuttons(title: 'Log In',colour: Colors.blue,onpress:  () async{
                setState(() {
                  LoadingSpinner=true;
                });
                try {
                  final user = await _auth.signInWithEmailAndPassword(
                      email: email, password: password);
                if(user != null)
                  {
                    Navigator.pushNamed(context, ChatScreen.id);
                  }
                  setState(() {
                    LoadingSpinner=false;
                  });
                }
                catch(e)
                {
                  print(e);
                }
                }),


            ],
          ),
        ),
      ),
    );
  }
}
