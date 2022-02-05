import 'package:captain_api/constant.dart';
import 'package:captain_api/controllers/home_controller.dart';
import 'package:captain_api/global_components/global_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatelessWidget {
  //HomeScreen({Key? key}) : super(key: key);
  var categoryController = Get.put(HomeController());
  var groceryController = Get.put(HomeController());
  var clothController = Get.put(HomeController());
  var liquorController = Get.put(HomeController());
  var foodController = Get.put(HomeController());
  var recommendedController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorConfig.fullAABackground,
          body:Obx(()=> foodController.foodData.length==1? ListView(
            padding: EdgeInsets.all(SizeConfig.size15),
            children: [
              Container(
                margin: EdgeInsets.only(top: SizeConfig.size8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(SizeConfig.size8),
                  color: ColorConfig.background,
                  boxShadow: [
                    BoxShadow(
                        color: ColorConfig.shadowColor.withAlpha(18),
                        blurRadius: 4,
                        offset: const Offset(0, 1))
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        //for toggle
                        categoryController.grocery.toggle();
                      },
                      child: Obx(() {
                        return CategoryWidget(
                          iconData: MdiIcons.cartOutline,
                          actionText:
                          "${categoryController.categoryData[0]["title"]}",
                          isSelected: categoryController.grocery.value,
                        );
                      }),
                    ),
                    InkWell(
                      onTap: () {
                        categoryController.cloth.toggle();
                      },
                      child: Obx(
                            () => CategoryWidget(
                          iconData: MdiIcons.hanger,
                          actionText: categoryController.categoryData[1]
                          ["title"],
                          isSelected: categoryController.cloth.value,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        categoryController.liquor.toggle();
                      },
                      child: Obx(
                            () => CategoryWidget(
                          iconData: MdiIcons.glassWine,
                          actionText: categoryController.categoryData[2]
                          ["title"],
                          isSelected: categoryController.liquor.value,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        categoryController.food.toggle();
                      },
                      child: Obx(
                            () => CategoryWidget(
                            iconData: MdiIcons.food,
                            isSelected: categoryController.food.value,
                            actionText: categoryController.categoryData[3]
                            ["title"]),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              //for products
              ProductWidget(
                  foodController.foodData[0]["image"],
                  foodController.foodData[0]["name"],
                  foodController.foodData[0]["rating"],
                  foodController.foodData[0]["store"],
                  foodController.foodData[0]["price"],
                  foodController.foodData[0]["favourite"]),
              ProductWidget(
                  clothController.clothData[0]["image"],
                  clothController.clothData[0]["name"],
                  clothController.clothData[0]["rating"],
                  clothController.clothData[0]["store"],
                  clothController.clothData[0]["price"],
                  clothController.clothData[0]["favourite"]),
              ProductWidget(
                  groceryController.groceryData[0]["image"],
                  groceryController.groceryData[0]["name"],
                  groceryController.groceryData[0]["rating"],
                  groceryController.groceryData[0]["store"],
                  groceryController.groceryData[0]["price"],
                  groceryController.groceryData[0]["favourite"]),
              ProductWidget(
                  liquorController.liquorData[0]["image"],
                  liquorController.liquorData[0]["name"],
                  liquorController.liquorData[0]["rating"],
                  liquorController.liquorData[0]["store"],
                  liquorController.liquorData[0]["price"],
                  liquorController.liquorData[0]["favourite"]),
              //for recommended
              Container(
                margin: EdgeInsets.only(top: SizeConfig.size24),
                child: Text("Recommended",
                    style: GlobalComponents.buildTextStyle(
                        Get.textTheme.subtitle1,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0)),
              ),
              ProductWidget(
                  recommendedController.recommendedData[0]["image"],
                  recommendedController.recommendedData[0]["name"],
                  recommendedController.recommendedData[0]["rating"],
                  recommendedController.recommendedData[0]["store"],
                  recommendedController.recommendedData[0]["price"],
                  recommendedController.recommendedData[0]["favourite"]),
              ProductWidget(
                  recommendedController.recommendedData[1]["image"],
                  recommendedController.recommendedData[1]["name"],
                  recommendedController.recommendedData[1]["rating"],
                  recommendedController.recommendedData[1]["store"],
                  recommendedController.recommendedData[1]["price"],
                  recommendedController.recommendedData[1]["favourite"]),
              ProductWidget(
                  recommendedController.recommendedData[2]["image"],
                  recommendedController.recommendedData[2]["name"],
                  recommendedController.recommendedData[2]["rating"],
                  recommendedController.recommendedData[2]["store"],
                  recommendedController.recommendedData[2]["price"],
                  recommendedController.recommendedData[2]["favourite"]),
            ],
          ) : Center(child: CircularProgressIndicator())
      ),
      )
    );
  }
}
