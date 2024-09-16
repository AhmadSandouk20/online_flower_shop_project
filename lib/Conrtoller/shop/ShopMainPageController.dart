import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_flower_shop/Conrtoller/shop/flowerController.dart';
import 'package:online_flower_shop/View/shop/flowers/flowersScreen.dart';
import 'package:online_flower_shop/common/preferences.dart';

import '../../View/shop/categoriesNavigationDialog.dart';
import '../../common/api/dioHelper.dart';
import '../../common/component/categoriesEnum.dart';

class ShopMainPageController extends GetxController {
  static openCategoriesDialog() async {
    await flowerNavigationDialog();
  }

  static openView(CategoriesEnum categoryType) {
    switch (categoryType) {
      case CategoriesEnum.flowers:
        Get.to(
          () => FlowersScreen(),
          binding: BindingsBuilder.put(
            () => FlowerController(),
          ),
        );
      case CategoriesEnum.plants:
      case CategoriesEnum.bouquet:
      case CategoriesEnum.offers:
      case CategoriesEnum.gifts:
      default:
        return;
    }
  }

  static get classicWhitePeony =>
      "assets/images/HomePage/Classic_white_peony__cream_beige_rose.png";

  TextEditingController searchEditingController = TextEditingController();

  TextEditingController get searchEController => searchEditingController;
  set searchEController(value) => searchEditingController = value;

  int currenIndex = 0;

  set selectedBottomIndex(
    int index,
  ) {
    currenIndex = index;
    update();
  }

  int get selectedBottomIndex => currenIndex;

  get shopMainHeadingImage =>
      "assets/images/HomePage/Classic_white_peony__cream_beige_rose.png";

  Future<Response?> getShopData(path, query) async {
    await DioHelper.getData(
      path: path,
      query: query,
    ).then((res) {
      return res;
    });
  }

  // @override
  // void onClose() {
  //   // TODO delete from here
  //   sharedPrefs.clear();
  //   super.onClose();
  // }
}
