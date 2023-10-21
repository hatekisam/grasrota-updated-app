import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  int curIndex = 1;
//   final AuthService _auth = AuthService();
  String username = "";
  String email = "";
  String password = "";
  String tlf = "";
  String error = "";
  File? imageFile;
  int price = 100;
  bool iAccept = false;
  bool colorRed = false;
  bool isLoading = false;
  bool _isError = false;
  String errorMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  FractionallySizedBox(
                    widthFactor: 1,
                    child: Image.asset("assets/logo.png"),
                  ),
                  // const SizedBox(height: 20),
                  MediaQuery(
                    data: MediaQuery.of(context).copyWith(
                      textScaleFactor: 1.0,
                    ),
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,

                          //   decoration:
                          //       textInputDecoration.copyWith(hintText: "Email"),
                          validator: (val) =>
                              val!.isEmpty ? "Skriv inn en email" : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          //   decoration:
                          //       textInputDecoration.copyWith(hintText: "Passord"),
                          obscureText: true,
                          validator: (val) => val!.length < 6
                              ? "Skriv inn et passord på 6+ tegn"
                              : null,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      HapticFeedback.heavyImpact();
                      //       Navigator.push(
                      //         context,
                      //         PageRouteBuilder(
                      //             pageBuilder: (context, animation1, animation2) =>
                      //                 Forgot(toggleView: widget.toggleView)),
                      //       );
                    },
                    child: const Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: const Text(
                        "glemt passord?",
                        textScaleFactor: 1.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 225,
                        color: Color(0xFF0acbee),
                        child: const Text("Logg inn",
                            textScaleFactor: 1.0,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ),
                      onTap: () async {
                        HapticFeedback.heavyImpact();
                        // if (_formKey.currentState!.validate()) {
                        //   setState(() => loading = true);
                        //   dynamic result =
                        //       await _auth.RegisterWithEmailAndPassword(
                        //           email.trim(), password.trim(), false);
                        //   debugPrint('@@@@@@@@@@@@@@@');
                        //   print(result);
                        //   debugPrint('@@@@@@@@@@@@@@@98258879');
                        //   if (result == null) {
                        //     setState(() {
                        //       error = "feil email eller passord";
                        //       loading = false;
                        //     });
                        //   } else if (result is String) {
                        //     setState(() {
                        //       error = result;
                        //       loading = false;
                        //     });
                        //   } else {
                        //     print('object');
                        //     Navigator.pushReplacement(
                        //       context,
                        //       PageRouteBuilder(
                        //         pageBuilder:
                        //             (context, animation1, animation2) =>
                        //                 Wrapper(),
                        //         transitionDuration: Duration(seconds: 0),
                        //       ),
                        //     );
                        //   }
                        // }
                      }),
                  const SizedBox(height: 20),
                  Text(error,
                      textScaleFactor: 1.0,
                      style: const TextStyle(color: Colors.red, fontSize: 16),
                      textAlign: TextAlign.center),
                  const SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: "har ikke en konto? ",
                          style: const TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: "lag en konto",
                          style: const TextStyle(
                              color: Colors.cyan,
                              fontWeight: FontWeight.bold,
                              height: 2.5),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              HapticFeedback.heavyImpact();
                              //       Navigator.push(
                              //         context,
                              //         PageRouteBuilder(
                              //             pageBuilder:
                              //                 (context, animation1, animation2) =>
                              //                     Register(
                              //                         toggleView: widget.toggleView)),
                              //       );

                              // widget.toggleView(3);
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          //   if (Platform.isAndroid) ...[
          //     MediaQuery(
          //       data: MediaQuery.of(context).copyWith(
          //         textScaleFactor: 1.0,
          //       ),
          //       child: RegisterButton(Buttons.Google, text: "Logg inn med Google",
          //           onPressed: () async {
          //         setState(() => loading = true);
          //         StoredData.choosenOrg = "";
          //         StoredData.adminOrg = "";
          //         StoredData.isAdmin = false;
          //         dynamic result = await _auth.RegisterWithGoogle();
          //         print(result);

          //         if (result == null) {
          //           setState(() {
          //             error = "noe gikk galt";
          //             loading = false;
          //           });
          //         } else if (result is String) {
          //           setState(() {
          //             error = result;
          //             loading = false;
          //           });
          //         } else {
          //           print('object---------------');
          //           // print(result);
          //           print('User UID: ${result.user.uid}');
          //           Navigator.pushReplacement(
          //             context,
          //             PageRouteBuilder(
          //               pageBuilder: (context, animation1, animation2) =>
          //                   Wrapper(),
          //               transitionDuration: Duration(seconds: 0),
          //             ),
          //           );
          //         }
          //       }),
          //     ),
          //   ],
          //   if (Platform.isIOS) ...[
          //     MediaQuery(
          //       data: MediaQuery.of(context).copyWith(
          //         textScaleFactor: 1.0,
          //       ),
          //       child: RegisterButton(Buttons.Apple, text: "Logg inn med Apple",
          //           onPressed: () async {
          //         setState(() => loading = true);
          //         StoredData.choosenOrg = "";
          //         StoredData.adminOrg = "";
          //         StoredData.isAdmin = false;
          //         dynamic result = await _auth.RegisterWithApple();
          //         if (result == null) {
          //           setState(() {
          //             error = "noe gikk galt";
          //             loading = false;
          //           });
          //         } else if (result is String) {
          //           setState(() {
          //             error = result;
          //             loading = false;
          //           });
          //         } else {
          //           Navigator.pushReplacement(
          //             context,
          //             PageRouteBuilder(
          //               pageBuilder: (context, animation1, animation2) =>
          //                   Wrapper(),
          //               transitionDuration: Duration(seconds: 0),
          //             ),
          //           );
          //         }
          //       }),
          //     ),
          //   ],
        ],
      ),
    );
  }
}
