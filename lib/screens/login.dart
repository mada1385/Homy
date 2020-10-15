import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:homy/components/Roundbutton.dart';
import 'package:homy/components/colors.dart';
import 'package:homy/components/primarytextfield.dart';
import 'package:homy/components/texts.dart';
import 'package:homy/components/title.dart';
// import 'package:homy/constants/colors.dart';
import 'package:homy/constatns/colors.dart';
import 'package:homy/logic/user.dart';
import 'package:homy/screens/homescreen.dart';
// import 'package:homy/screens/addporthomy.dart';
// import 'package:homy/screens/Home.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:homy/main.dart';
// import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:homy/screens/regestraiton.dart';

class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final email = TextEditingController();
  bool emailvalidate = false;
  final password = TextEditingController();
  bool passwordvalidate = false;
  String eemail = null, epassword = null;
  String hint = "email";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: k_primarycolor,
      body: Column(
        children: <Widget>[
          Flexible(
            child: SizedBox(
              height: 150,
            ),
          ),
          Hero(
              tag: "logo",
              child: Container(
                  child: Image.asset(
                "asset/HOMY.png",
                width: 200,
                height: 200,
              ))),
          SizedBox(
            height: 20,
          ),
          Primarytextfield(
            controller: email,
            validate: emailvalidate,
            hint: "emial",
            error: eemail,
          ),
          Primarytextfield(
            controller: password,
            validate: passwordvalidate,
            hint: "password",
            obsucure: true,
            error: epassword,
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(right: 75),
                  child: GestureDetector(
                      child: Text(
                    "forgot password ?",
                    style: TextStyle(color: primaryColor),
                  )))
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Roundbutton(
            func: () async {
              // User loginuser = User(email: email, password: password);
              // final loggeduser = await loginuser.login();
              // if (loggeduser != null) {
              //   print(loggeduser);
              //   // Navigator.pushReplacement(context,
              //   //     MaterialPageRoute(builder: (context) => Addportoflioscreen(useremail: loggeduser ,)));
              // } else {
              //   showAlertDialog(BuildContext context) {
              //     // set up the button
              //     Widget okButton = FlatButton(
              //       child: Text("OK"),
              //       onPressed: () {},
              //     );

              //     // set up the AlertDialog
              //     AlertDialog alert = AlertDialog(
              //       title: Text("error"),
              //       content: Text(
              //         loggeduser,
              //         style: TextStyle(color: k_primarycolor),
              //       ),
              //       actions: [
              //         okButton,
              //       ],
              //       backgroundColor: k_backgroundcolor,
              //     );

              //     // show the dialog
              //     showDialog(
              //       context: context,
              //       builder: (BuildContext context) {
              //         return alert;
              //       },
              //     );
              //   }
              // }
              setState(() {
                email.text.isEmpty
                    ? emailvalidate = true
                    : emailvalidate = false;
                password.text.isEmpty
                    ? passwordvalidate = true
                    : passwordvalidate = false;
              });
              if (!email.text.isEmpty && !password.text.isEmpty) {
                if (EmailValidator.validate(email.text)) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Homescreen()));
                }
              }
              if (!EmailValidator.validate(email.text)) {
                emailvalidate = true;
                eemail = "email is not valid";
              }
            },
            label: "login",
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(children: <Widget>[
                Text(
                  "__________ or sign in with__________",
                  style: TextStyle(color: primaryColor),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    // SizedBox(width: 100,),
                    GestureDetector(
                        child: Image.asset("asset/59439.png", height: 30),
                        onTap: () {}),
                    SizedBox(
                      width: 30,
                    ),
                    GestureDetector(
                      child: Image.asset("asset/pngguru.png", height: 30),
                      onTap: () async {
                        User x = User();
                        if (await x.handleSignIn() != null) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Homescreen()));
                        } else {}
                      },
                    ),
                  ],
                ),
                //  Signin(label: "facebook",logo: Image.asset("asset/5943.png",height: 30 ,), ),
                //  SizedBox(height: 7.5,),
                //  Signin(label: "Google",logo: Image.asset("asset/google.png",height: 30 ,),),
                // SignInButton(
                //   Buttons.Facebook,
                //   text: "facebook",
                //   onPressed: () {},
                // ),
                // SignInButton(
                //   Buttons.Google,
                //   text: "Google",
                //   onPressed: () {},
                // ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "dont have account?",
                      style: TextStyle(color: primaryColor),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Regstration()));
                      },
                      child: Text(
                        "sign up now",
                        style: TextStyle(
                            color: primaryColor,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                )
              ])
            ],
          ),
        ],
      ),
    );
  }
}

class Signin extends StatelessWidget {
  final Image logo;
  final String label;
  final Function func;
  Signin({this.label, this.logo, this.func});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        color: Colors.white,
        constraints: BoxConstraints(
          maxWidth: 220,
          maxHeight: 36.0,
        ),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 13,
                ),
                child: logo,
              ),
              Text(
                label,
                // "facebook",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: k_primarycolor,
                  fontSize: 12,
                  backgroundColor: Color.fromRGBO(0, 0, 0, 0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
