import 'package:captain_api/models/onboard_model.dart';
import 'package:captain_api/views/auths/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'package:get/get.dart';

class OnboardController extends GetxController{

  var selectCurrentIndex = 0.obs;
  var pageController = PageController();
  bool get isLastPage => selectCurrentIndex.value == onboardItems.length-1;

  void forwordAction(){
    if(isLastPage){
      Get.off(SignInScreen());
    }else{
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  List<OnboardModel> onboardItems = [
    OnboardModel("assets/images/illu-1.png", "Find lots of product\naround the world", "Be the first to know about sales and freebies , find out what goes on behind the scenes or message me with special requests on Facebook and Instagram."),
    OnboardModel("assets/images/illu-2.png", "Secure payment\nwith SSL", "Alternatively, you can take payments through a provider with authorization from financial regulators, like GoCardless. Customers will then give their payment details over the provider’s SSL secured site."),
    OnboardModel("assets/images/illu-3.png", "Fast delivery\nat a snap", "Only a few states extend SNAP to allow the elderly, people with disabilities, and the homeless to purchase food at fast-food restaurants with their EBT cards."),
  ];
}
