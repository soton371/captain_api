import 'dart:convert';
import 'package:captain_api/constant.dart';
import 'package:captain_api/views/full_app_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class AuthController extends GetxController{

  void signIn(String email,String password) async {
    var payload = {"email": email,"password": password};
    var url = Uri.parse(CallApi.signinUrl);

    var response = await http.post(url, body: payload);
    switch (response.statusCode){
      case 200:{
        Get.off(FullAppScreen());
        Get.snackbar("Welcome","to captain api");
      }break;
      default: {
        Get.snackbar(response.statusCode.toString(),json.decode(response.body)['error']);
      } break;
    }
  }

  void signUp(String username, String email, String password) async {
    var payload = {"email": email,"password": password};
    var url = Uri.parse(CallApi.signupUrl);

    var response = await http.post(url, body: payload);
    switch (response.statusCode){
      case 200:{
        Get.off(FullAppScreen());
        Get.snackbar("Welcome",username);
      }break;
      default: {
        Get.snackbar(response.statusCode.toString(),json.decode(response.body)['error']);
      } break;
    }
  }

}

