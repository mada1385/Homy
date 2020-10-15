import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:homy/components/Roundbutton.dart';
import 'package:homy/components/primarytextfield.dart';
import 'package:homy/components/title.dart';
import 'package:homy/constatns/colors.dart';
// import 'package:homy/constants/colors.dart';
import 'package:homy/logic/user.dart';
import 'package:homy/screens/login.dart';
import 'package:homy/screens/otpscreen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';

class Regstration extends StatefulWidget {
  @override
  _RegstrationState createState() => _RegstrationState();
}

class _RegstrationState extends State<Regstration> {
  final name = TextEditingController(),
      email = TextEditingController(),
      password = TextEditingController(),
      jobtittle = TextEditingController(),
      confirmpassword = TextEditingController();

  Uri url, urls;

  bool vname = false,
      vemail = false,
      vpassword = false,
      vjobtittle = false,
      vconfirmpassword = false,
      opassword = true,
      ocpassword = true;

  String ename = null,
      eemail = null,
      epassword = null,
      ejobtittle = null,
      econfirmpassword = null;

  String errortext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: k_primarycolor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: SizedBox(
                height: 20,
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
            // Padding(
            //     padding: EdgeInsets.only(right: 90, left: 78), child: k_title),
            SizedBox(
              height: 20,
            ),
            Primarytextfield(
              hint: "username",
              controller: name,
              validate: vname,
              error: ename,
            ),
            SizedBox(
              height: 10,
            ),
            Primarytextfield(
              hint: "mail",
              controller: email,
              validate: vemail,
              error: eemail,
            ),
            SizedBox(
              height: 10,
            ),
            Primarytextfield(
              hint: "jobtittle",
              controller: jobtittle,
              validate: vjobtittle,
              error: ejobtittle,
            ),
            SizedBox(
              height: 10,
            ),
            Primarytextfield(
              hint: "password",
              controller: password,
              validate: vpassword,
              obsucure: opassword,
              error: epassword,
            ),
            SizedBox(
              height: 10,
            ),
            Primarytextfield(
              hint: "confirmpassword",
              controller: confirmpassword,
              validate: vconfirmpassword,
              obsucure: ocpassword,
              error: econfirmpassword,
            ),
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            Roundbutton(
                label: "signup",
                func: () async {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OtpVerification()));
                  // setState(() {
                  //   name.text.isEmpty ? vname = true : vname = false;

                  //   email.text.isEmpty ? vemail = true : vemail = false;

                  //   password.text.isEmpty
                  //       ? vpassword = true
                  //       : vpassword = false;

                  //   jobtittle.text.isEmpty
                  //       ? vjobtittle = true
                  //       : vjobtittle = false;

                  //   password.text.isEmpty
                  //       ? vpassword = true
                  //       : vpassword = false;

                  //   confirmpassword.text.isEmpty
                  //       ? vconfirmpassword = true
                  //       : vconfirmpassword = false;
                  // });
                  // if (!name.text.isEmpty &&
                  //     !email.text.isEmpty &&
                  //     !jobtittle.text.isEmpty &&
                  //     !password.text.isEmpty &&
                  //     !confirmpassword.text.isEmpty) {
                  //   if (EmailValidator.validate(email.text)) {
                  //     if (password.text == confirmpassword.text) {
                  //       print(url);
                  //       User newuser = User(
                  //           email: email.text,
                  //           jobtitle: jobtittle.text,
                  //           name: name.text,
                  //           password: password.text);

                  //       final logged = await newuser.register();
                  //       if (logged != null) {
                  //         Navigator.pushReplacement(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) => Loginpage()));
                  //       }
                  //     }
                  //   }
                  // }
                  // if (password.text != confirmpassword.text) {
                  //   vconfirmpassword = true;
                  //   econfirmpassword = "password is not matching";
                  //   print(econfirmpassword);
                  // }
                  // if (!EmailValidator.validate(email.text)) {
                  //   vemail = true;
                  //   eemail = "email is not valid";
                  // }
                }),
            SizedBox(
              height: 20,
            )
          ],
        ));
  }
}
