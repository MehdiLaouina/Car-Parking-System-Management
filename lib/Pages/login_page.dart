import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

import '../config.dart';
import '../models/login_request_model.dart';
import '../services/api_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool isAPIcallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  //text controllers
  String? inputEmail;
  String? inputPassword;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey[300],
          body: ProgressHUD(
            inAsyncCall: isAPIcallProcess,
            key: UniqueKey(),
            child: Form(
              key: globalFormKey,
              child: loginUI(context),
            ),
          )),
    );
  }

  Widget loginUI(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(height: 50),
          Image.asset(
            'assets/images/App_Logo.png',
            height: 160,
            width: 160,
          ),
          const SizedBox(height: 50),
          //Hello Again!
          SizedBox(
            width: 250, // or any width that works for your design
            child: Center(
              child: Text(
                "Bonjour à Nouveau!",
                style: GoogleFonts.bebasNeue(
                  fontSize: 52,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "A catch phrase!",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 50),

          //email textfield
          FormHelper.inputFieldWidget(
            context,
            "email",
            "Email",
            prefixIcon: const Icon(
              Icons.email,
              color: Colors.deepPurple,
            ),
            showPrefixIcon: true,
            (onValidateVal) {
              if (onValidateVal.toString().isEmpty) {
                return "Email can't be empty";
              }
              return null;
            },
            (onSavedVal) {
              inputEmail = onSavedVal;
            },
            backgroundColor: (Colors.grey[200])!,
            borderFocusColor: Colors.deepPurple,
            borderColor: Colors.white,
            textColor: Colors.black,
            hintColor: Colors.black.withOpacity(0.2),
            borderRadius: 10,
          ),

          //password textfield
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: FormHelper.inputFieldWidget(
              context,
              "password",
              "Password",
              prefixIcon: const Icon(
                Icons.lock,
                color: Colors.deepPurple,
              ),
              showPrefixIcon: true,
              (onValidateVal) {
                if (onValidateVal.toString().isEmpty) {
                  return "Password can't be empty";
                }
                return null;
              },
              (onSavedVal) {
                inputPassword = onSavedVal;
              },
              backgroundColor: (Colors.grey[200])!,
              borderFocusColor: Colors.deepPurple,
              borderColor: Colors.white,
              textColor: Colors.black,
              hintColor: Colors.black.withOpacity(0.2),
              borderRadius: 10,
              obscureText: hidePassword,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
                color: Colors.deepPurple.withOpacity(0.5),
                icon: Icon(
                  hidePassword ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          //sign in button
          Center(
            child: SizedBox(
              height: 60,
              width: 200,
              child: FormHelper.submitButton(
                "Se Connecter",
                () {
                  if (validateAndSave()) {
                    setState(() {
                      isAPIcallProcess = true;
                    });

                    LoginRequestModel model = LoginRequestModel(
                        email: inputEmail!, password: inputPassword!);
                    APIService.login(model).then((response) {
                      setState(() {
                        isAPIcallProcess = false;
                      });
                      if (response) {
                        FormHelper.showSimpleAlertDialog(
                            context, Config.appName, "Login Succesfull!", "OK",
                            () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/home', (route) => false);
                        });
                      } else {
                        FormHelper.showSimpleAlertDialog(
                            context,
                            Config.appName,
                            "Invalid Email/password !",
                            "OK", () {
                          Navigator.pop(context);
                        });
                      }
                    });
                  }
                },
                btnColor: Colors.deepPurple,
                borderColor: Colors.white,
                txtColor: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                borderRadius: 10,
              ),
            ),
          ),

          const SizedBox(height: 25),

          //register button textfield
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('N\'est pas membre?',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/register', (route) => false);
                },
                child: const Text(
                  ' Register Now',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          const SizedBox(height: 40),
        ]),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}
