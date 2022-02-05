import 'package:captain_api/constant.dart';
import 'package:captain_api/controllers/auth_controller.dart';
import 'package:captain_api/global_components/global_components.dart';
import 'package:captain_api/views/auths/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class SignInScreen extends StatelessWidget {
  //const SignInScreen({Key? key}) : super(key: key);

  var controller = Get.put(AuthController());
  var email = TextEditingController();
  var password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Center(
              child: Text(
                "Log In",
                style: GlobalComponents.buildTextStyle(
                    Get.textTheme.headline5,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 48,
                  right: 48,
                  top: 30),
              child: Text(
                "Enter your login details to access your account",
                softWrap: true,
                style: GlobalComponents.buildTextStyle(Get.textTheme.bodyText1,
                    fontWeight: FontWeight.w500,
                    height: 1.2,
                    color: ColorConfig.onBackground.withAlpha(160)),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 30),
              child: Container(
                decoration: BoxDecoration(
                    color: ColorConfig.background,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 8.0,
                          color: ColorConfig.shadowColor.withAlpha(25),
                          offset: const Offset(0, 3)),
                    ]),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      style: GlobalComponents.buildTextStyle(
                          Get.textTheme.bodyText1,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.2),
                      decoration: InputDecoration(
                        hintStyle: GlobalComponents.buildTextStyle(
                            Get.textTheme.bodyText1,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0,
                            color: ColorConfig.onBackground
                                .withAlpha(100)
                            ),
                        hintText: "Email Address",
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        isDense: true,
                        contentPadding: const EdgeInsets.all(15),
                      ),
                      autofocus: false,
                      keyboardType: TextInputType.emailAddress,
                      controller: email
                          // TextEditingController(text: "soton@gmail.com"),
                    ),
                    Divider(
                      color: ColorConfig.dividerColor,
                      height: 0.5,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: TextFormField(
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
                                  color: ColorConfig.onBackground
                                      .withAlpha(100)),
                              hintText: "Your Password",
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              isDense: true,
                              contentPadding: const EdgeInsets.all(15),
                            ),
                            autofocus: false,
                            textInputAction: TextInputAction.search,
                            textCapitalization: TextCapitalization.sentences,
                            obscureText: true,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            
                          },
                          child: Text("FORGOT",
                              style: GlobalComponents.buildTextStyle(
                                  Get.textTheme.bodyText2,
                                  letterSpacing: 0.5,
                                  color: ColorConfig.onBackground
                                      .withAlpha(100),
                                  fontWeight: FontWeight.w500)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 30),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.all(Radius.circular(48)),
                    boxShadow: [
                      BoxShadow(
                        color: ColorConfig.primary.withAlpha(100),
                        blurRadius: 5,
                        offset: const Offset(0, 5), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: ColorConfig.primary
                    ),
                    onPressed: () async{
                      controller.signIn(email.text,password.text);
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
                                fontWeight: FontWeight.w500),
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
                  ),
                )),
            GestureDetector(
              onTap: () {
                Get.off(SignupScreen());
              },
              child: Container(
                margin: const EdgeInsets.only(top: 15),
                child: Center(
                  child: Text(
                    "I haven't an account",
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
    );
  }
}
