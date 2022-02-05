import 'package:flutter/material.dart';

class ColorConfig {
  static var primary = const Color(0xff3d62fe);
  static var primaryVariant = const Color(0xff0054fe);
  static var background = Colors.white;
  static var secondary= const Color(0xff03dac6);
  static var secondaryVariant= const Color(0xff018786);
  static var shadowColor = Colors.black12;
  static var dividerColor = Colors.black12;
  static var surface = Colors.white;
  static var error = const Color(0xff790000);
  static var onPrimary = Colors.white;
  static var onSecondary = Colors.black;
  static var onSurface = Colors.black;
  static var onBackground = Colors.black;
  static var onError = Colors.white;
  static var fullAABackground = const Color(0xffF7F7F7);
  static const Color starColor = Color(0xfff9c700);
  static const Color favouriteColor = Colors.redAccent;
}

//api list
class CallApi{
  static var signinUrl = "https://reqres.in/api/login";
  static var signupUrl = "https://reqres.in/api/register";
}


class SizeConfig{
  static var size4 = 4.0;
  static var size8 = 8.0;
  static var size12 = 12.0;
  static var size15 = 15.0;
  static var size16 = 16.0;
  static var size20 = 20.0;
  static var size24 = 24.0;
  static var size52 = 52.0;
  static var size90 = 90.0;
}