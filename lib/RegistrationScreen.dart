import 'package:flutter/material.dart';
import 'inputFiled.dart';
import 'Buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chatScreen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool Loadingspinner=false;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: Loadingspinner,
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
                  email=value;
                },
                decoration: kinputfield.copyWith(hintText:'Enter New Email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                password=value;
                },
                decoration: kinputfield.copyWith(hintText: 'Enter New Password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              Roundbuttons(title: 'Register',colour: Colors.blue,onpress:  ()async {
                setState(() {
                  Loadingspinner=true;
                });
                try {
                  final newUser = await _auth.createUserWithEmailAndPassword(
                      email: email, password: password);
                  if(newUser!=null)
                    {
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                  setState(() {
                    Loadingspinner=false;
                  });
                }
                catch(e){
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
