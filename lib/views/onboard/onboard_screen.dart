import 'package:captain_api/constant.dart';
import 'package:captain_api/controllers/onboard_controller.dart';
import 'package:captain_api/global_components/global_components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardScreen extends StatelessWidget {
  //const OnboardScreen({Key? key}) : super(key: key);

  final controller = OnboardController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConfig.background,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: controller.pageController,
                onPageChanged: controller.selectCurrentIndex,
                itemCount: controller.onboardItems.length,
                itemBuilder: (_, i) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Image.asset(
                            controller.onboardItems[i].imageUrl,
                            height: 320,
                            width: 300,
                          ),
                        ),
                        SizedBox(height: 30,),
                        Text(
                          controller.onboardItems[i].title,
                          style: GlobalComponents.buildTextStyle(
                              Get.textTheme.bodyText1,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          controller.onboardItems[i].description,
                          style: GlobalComponents.buildTextStyle(
                              Get.textTheme.bodyText2,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  );
                }),
            Positioned(
                bottom: 25,
                left: 15,
                child: Row(
                    children: List.generate(
                  controller.onboardItems.length,
                  (index) => Obx(() {
                    return Container(
                      height: 4,
                      width: controller.selectCurrentIndex.value == index
                          ? 80
                          : 25,
                      margin: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                          color: controller.selectCurrentIndex.value == index
                              ? ColorConfig.primary
                              : ColorConfig.primary.withOpacity(0.2),
                          //shape: BoxShape.circle
                      ),
                    );
                  }),
                ))),
            Positioned(
              bottom: 10,
                right: 15,
                child: TextButton(
                    onPressed: controller.forwordAction,
                    child: Obx(() {
                        return Text(controller.isLastPage?"Start":"Next",
                        style: GlobalComponents.buildTextStyle(
                          Get.textTheme.button,
                          fontWeight: FontWeight.w500,
                          color: ColorConfig.primary
                        ),
                        );
                      }
                    ),
                  style: TextButton.styleFrom(
                    shape: StadiumBorder()
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
