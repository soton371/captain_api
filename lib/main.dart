import 'dart:async';
import 'package:captain_api/constant.dart';
import 'package:captain_api/global_components/global_components.dart';
import 'package:captain_api/views/full_app_screen.dart';
import 'package:captain_api/views/onboard/onboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'dart:io';


// class MyHttpOverrides extends HttpOverrides{
//   @override
//   HttpClient createHttpClient(SecurityContext ?context){
//     return super.createHttpClient(context)
//       ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
//   }
// }

void main() {
  // HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Captain Api',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        primaryColor: ColorConfig.primary
      ),
      home: const FullAppScreen()
    );
  }
}


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      const Duration(seconds: 3), ()=> Get.off(OnboardScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/splash.png",height: 200,width: 200,),
            const SizedBox(height: 30,),
            Text("Version: 1.0.0",
              style: GlobalComponents.buildTextStyle(Get.textTheme.caption),
            ),
          ],
        ),
      ),
    );
  }
}

