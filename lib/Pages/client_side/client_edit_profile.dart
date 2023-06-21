import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

import '../../models/client/Client.dart';
import '../../models/client/register_request_model.dart';

class ClientEditProfile extends StatefulWidget {
  final Client client;
  const ClientEditProfile({super.key, required this.client});

  @override
  State<ClientEditProfile> createState() => _ClientEditProfileState();
}

class _ClientEditProfileState extends State<ClientEditProfile> {
  bool isAPIcallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  //text controllers
  String? inputEmail;
  String? inputNom;
  String? inputVehicule;
  String? inputImmatriculation;
  double? inputSolde;
  String? inputPaymentMethod;

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
              child: editUI(context),
            ),
          )),
    );
  }

  Widget editUI(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(height: 20),
          SizedBox(
            width: 120,
            height: 120,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset('assets/images/App_Logo.png'),
            ),
          ),
          const SizedBox(height: 30),

          //Name textfield
          FormHelper.inputFieldWidget(
            context,
            "name",
            widget.client.data.name,
            prefixIcon: const Icon(
              Icons.person,
              color: Colors.deepPurple,
            ),
            showPrefixIcon: true,
            (onValidateVal) {
              if (onValidateVal.toString().isEmpty) {
                return "Name can't be empty";
              }
              return null;
            },
            (onSavedVal) {
              inputNom = onSavedVal;
            },
            backgroundColor: (Colors.grey[200])!,
            borderFocusColor: Colors.deepPurple,
            borderColor: Colors.white,
            textColor: Colors.black,
            hintColor: Colors.black.withOpacity(0.2),
            borderRadius: 10,
          ),

          //email textfield
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: FormHelper.inputFieldWidget(
              context,
              "email",
              widget.client.data.email,
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
          ),
          /*
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
          */
          //vehicule textfield
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: FormHelper.inputFieldWidget(
              context,
              "vehicule",
              widget.client.data.vehicule,
              prefixIcon: const Icon(
                Icons.car_rental,
                color: Colors.deepPurple,
              ),
              showPrefixIcon: true,
              (onValidateVal) {
                if (onValidateVal.toString().isEmpty) {
                  return "Vehicule field can't be empty";
                }
                return null;
              },
              (onSavedVal) {
                inputVehicule = onSavedVal;
              },
              backgroundColor: (Colors.grey[200])!,
              borderFocusColor: Colors.deepPurple,
              borderColor: Colors.white,
              textColor: Colors.black,
              hintColor: Colors.black.withOpacity(0.2),
              borderRadius: 10,
            ),
          ),

          //Immatriculation textfield
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: FormHelper.inputFieldWidget(
              context,
              "immatriculation",
              widget.client.data.N_immatriculation,
              prefixIcon: const Icon(
                Icons.format_list_numbered,
                color: Colors.deepPurple,
              ),
              showPrefixIcon: true,
              (onValidateVal) {
                if (onValidateVal.toString().isEmpty) {
                  return "Immatriculation field can't be empty";
                }
                return null;
              },
              (onSavedVal) {
                inputImmatriculation = onSavedVal;
              },
              backgroundColor: (Colors.grey[200])!,
              borderFocusColor: Colors.deepPurple,
              borderColor: Colors.white,
              textColor: Colors.black,
              hintColor: Colors.black.withOpacity(0.2),
              borderRadius: 10,
            ),
          ),

          //solde textfield
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: FormHelper.inputFieldWidget(
                context, "solde", "${widget.client.data.solde}",
                prefixIcon: const Icon(
                  Icons.monetization_on,
                  color: Colors.deepPurple,
                ),
                showPrefixIcon: true, (onValidateVal) {
              if (onValidateVal.toString().isEmpty) {
                return "Balance field can't be empty";
              }
              return null;
            }, (onSavedVal) {
              inputSolde = double.tryParse(onSavedVal) ?? 0.0;
            },
                backgroundColor: (Colors.grey[200])!,
                borderFocusColor: Colors.deepPurple,
                borderColor: Colors.white,
                textColor: Colors.black,
                hintColor: Colors.black.withOpacity(0.2),
                borderRadius: 10,
                isNumeric: true),
          ),

          //payment textfield
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: FormHelper.inputFieldWidget(
                context, "payment", widget.client.data.methodePayement,
                prefixIcon: const Icon(
                  Icons.paypal,
                  color: Colors.deepPurple,
                ),
                showPrefixIcon: true, (onValidateVal) {
              if (onValidateVal.toString().isEmpty) {
                return "Payment method field can't be empty";
              }
              return null;
            }, (onSavedVal) {
              inputPaymentMethod = onSavedVal;
            },
                backgroundColor: (Colors.grey[200])!,
                borderFocusColor: Colors.deepPurple,
                borderColor: Colors.white,
                textColor: Colors.black,
                hintColor: Colors.black.withOpacity(0.2),
                borderRadius: 10),
          ),

          const SizedBox(height: 20),

          //sign in button
          Center(
            child: SizedBox(
              height: 60,
              width: 200,
              child: FormHelper.submitButton(
                "Edit Profile",
                () {
                  if (validateAndSave()) {
                    setState(() {
                      isAPIcallProcess = true;
                    });
                    RegisterRequestModel model = RegisterRequestModel(
                        email: inputEmail!,
                        immatriculation: inputImmatriculation!,
                        name: inputNom!,
                        payment_method: inputPaymentMethod!,
                        solde: inputSolde!,
                        vehicule: inputVehicule!,
                        password: '');

                    //TO ADD API SERVICE FOR EDIT PROFILE
                    /*APIService.register(model).then(
                      (response) {
                        setState(() {
                          isAPIcallProcess = false;
                        });
                        if (response.message != null) {
                          FormHelper.showSimpleAlertDialog(
                              context,
                              Config.appName,
                              "registration Succesfull! Please Login to the account.",
                              "OK", () {
                            Navigator.pushNamedAndRemoveUntil(
                                context, '/login', (route) => false);
                          });
                        } else {
                          FormHelper.showSimpleAlertDialog(
                              context, Config.appName, "Invalid Inputs !", "OK",
                              () {
                            Navigator.pop(context);
                          });
                        }
                      },
                    )*/
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
