import 'package:captain_api/constant.dart';
import 'package:captain_api/controllers/auth_controller.dart';
import 'package:captain_api/global_components/global_components.dart';
import 'package:captain_api/views/auths/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';


class SignupScreen extends StatelessWidget {
  //const SignupScreen({Key? key}) : super(key: key);

  var controller = Get.put(AuthController());
  var username = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Center(
                  child: Text(
                    "Create an Account",
                    style: GlobalComponents.buildTextStyle(
                        Get.textTheme.headline5,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 48, right: 48, top: 30),
                  child: Text(
                    "Enter your details to create new your account",
                    softWrap: true,
                    style: GlobalComponents.buildTextStyle(
                        Get.textTheme.bodyText1,
                        fontWeight: FontWeight.w500,
                        height: 1.2,
                        color: Colors.black.withOpacity(0.6)
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15, right: 15, top: 30),
                  child: Container(
                    decoration: BoxDecoration(
                        color: ColorConfig.background,
                        borderRadius: const BorderRadius.all(Radius.circular(16)),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 8.0,
                              color: ColorConfig.shadowColor.withAlpha(25),
                              offset: const Offset(0, 3)),
                        ]),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: username,
                          style: GlobalComponents.buildTextStyle(
                              Get.textTheme.bodyText1,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.2),
                          decoration: InputDecoration(
                            hintStyle: GlobalComponents.buildTextStyle(
                                Get.textTheme.bodyText1,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0,
                                color: Colors.grey),
                            hintText: "Username",
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            isDense: true,
                            contentPadding: const EdgeInsets.all(16),
                          ),
                          autofocus: false,
                          textCapitalization: TextCapitalization.sentences,
                        ),
                        Divider(
                          color: ColorConfig.dividerColor,
                          height: 0.5,
                        ),
                        TextFormField(
                          controller: email,
                          style: GlobalComponents.buildTextStyle(
                              Get.textTheme.bodyText1,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.2),
                          decoration: InputDecoration(
                            hintStyle: GlobalComponents.buildTextStyle(
                                Get.textTheme.bodyText1,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0,
                                color: Colors.grey),
                            hintText: "Email Address",
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            isDense: true,
                            contentPadding: const EdgeInsets.all(16),
                          ),
                          autofocus: false,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        Divider(
                          color: ColorConfig.dividerColor,
                          height: 0.5,
                        ),
                        TextFormField(
                          controller: password,
                          style: GlobalComponents.buildTextStyle(
                              Get.textTheme.bodyText1,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.2),
                          decoration: InputDecoration(
                            hintStyle: GlobalComponents.buildTextStyle(
                                Get.textTheme.bodyText1,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0,
                                color: Colors.grey),
                            hintText: "Your Password",
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            isDense: true,
                            contentPadding: const EdgeInsets.all(16),
                          ),
                          autofocus: false,
                          textCapitalization: TextCapitalization.sentences,
                          obscureText: true,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(left: 15, right: 15, top: 30),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: ColorConfig.primary
                      ),
                      onPressed: () async{
                        controller.signUp(username.text,email.text,password.text);
                        final bool isConnected = await InternetConnectionChecker().hasConnection;
                        isConnected?"":Get.snackbar("No internet connection", "Please check your internet");
                      },
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "CONTINUE",
                              style: GlobalComponents.buildTextStyle(
                                  Get.textTheme.bodyText2,
                                  color: ColorConfig.onPrimary,
                                  letterSpacing: 0.8,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Positioned(
                            right: 16,
                            child: ClipOval(
                              child: Container(
                                color: ColorConfig.primaryVariant,
                                // button color
                                child: SizedBox(
                                    width: 25,
                                    height: 25,
                                    child: Icon(
                                      MdiIcons.arrowRight,
                                      color: ColorConfig.onPrimary,
                                      size: 15,
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                GestureDetector(
                  onTap: () {
                    Get.off(SignInScreen());
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: Center(
                      child: Text(
                        "I have already an account",
                        style: GlobalComponents.buildTextStyle(
                            Get.textTheme.bodyText2,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
