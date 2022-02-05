import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/services.dart' show rootBundle;

class HomeController extends GetxController{
  var grocery = false.obs;
  var cloth = true.obs;
  var liquor = false.obs;
  var food = true.obs;
  var categoryData = [].obs;
  var groceryData = [].obs;
  var clothData = [].obs;
  var liquorData = [].obs;
  var foodData = [].obs;
  var recommendedData = [].obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fatchCategoryData();
    fatchGroceryData();
    fatchClothData();
    fatchLiquorData();
    fatchFoodData();
    fatchRecommendedData();
  }

  Future fatchCategoryData() async {
    var jsonData = await rootBundle.loadString("assets/jsons/categoris.json");
    categoryData.value = json.decode(jsonData);
  }

  Future fatchGroceryData() async {
    var jsonData = await rootBundle.loadString("assets/jsons/gorcery.json");
    groceryData.value = json.decode(jsonData);
  }

  Future fatchClothData() async {
    var jsonData = await rootBundle.loadString("assets/jsons/cloth.json");
    clothData.value = json.decode(jsonData);
  }

  Future fatchLiquorData() async {
    var jsonData = await rootBundle.loadString("assets/jsons/liquor.json");
    liquorData.value = json.decode(jsonData);
  }

  Future fatchFoodData() async {
    var jsonData = await rootBundle.loadString("assets/jsons/food.json");
    foodData.value = json.decode(jsonData);
  }

  Future fatchRecommendedData() async {
    var jsonData = await rootBundle.loadString("assets/jsons/recommended.json");
    recommendedData.value = json.decode(jsonData);
  }
}