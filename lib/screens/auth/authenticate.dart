import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
//   final AuthService _auth = AuthService();

  String email = "";
  String password = "";
  String error = "";
  @override
  Widget build(BuildContext context) {
    if (subScriResp != "") {
      return Scaffold(
          body: Center(
              child: InkWell(
                  onTap: () {
                    HapticFeedback.heavyImpact();
                    setState(() {
                      subScriResp = "";
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black.withOpacity(0.4),
                    child: Center(
                        child: Container(
                      height: 310,
                      width: 300,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: MediaQuery(
                              data: MediaQuery.of(context).copyWith(
                                textScaleFactor: 1.0,
                              ),
                              child: PopUpInfo(
                                msg: subScriResp,
                              ))),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[50],
                      ),
                    )),
                  ))));
    } else {
      if (showSignIn == 1) {
        return SignIn(toggleView: toggleView);
      } else if (showSignIn == 2) {
        return Forgot(toggleView: toggleView);
      } else if (showSignIn == 3) {
        return Register(toggleView: toggleView);
      } else if (showSignIn == 4) {
        return Welcome(toggleView: toggleView);
      }
      return Welcome(toggleView: toggleView);
    }
  }
}
