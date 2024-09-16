import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:online_flower_shop/Model/review.dart';

import '../View/shop/flowers/flowerDetailsScreen.dart';
import '../common/api/dioHelper.dart';

import '../Model/flower.dart';

class FlowerDetailsController extends GetxController {
  getDetails(int id) {
    DioHelper.getData(
      path: "",
      query: {"id": id},
    ).then((
      data,
    ) {
      var decodedJson = json.decode(data.data);
      Flower flowerDetails = Flower.fromJsonWithDetails(decodedJson);
      return flowerDetails;
    });
  }

  TextEditingController _commentController = TextEditingController();

  get commentController => _commentController;

  final Flower _phalaenopsisWhiteOrchidSteamDetails = Flower(
    id: "00",
    name: "Phalaenopsis White Orchid Steam",
    price: 20,
    availabeColors: [
      Colors.white,
      Colors.pink,
      Colors.purple,
    ],
    categoryId: "01",
    imageUrl: "assets/images/fd/bigOrchid.png",
    inforamtion:
        "White orchids are elegant and timeless flowers that symbolize purity, beauty, and refinement. Known for their pristine white petals and intricate blooms, they are a favorite in both floral arrangements and home decor. White orchids are often associated with luxury and grace, making them a popular choice for weddings, anniversaries, and other special occasions.",
    reviwes: [
      Review(
        comment: "such a flower i love havig it in my living room",
        reviewDegree: 5.0,
        dateOfReview: "dateOfReview".tr,
        reviewrUserName: "username".tr,
      ),
      Review(
        comment: "beautiful",
        reviewDegree: 3.0,
        dateOfReview: "dateOfReview".tr,
        reviewrUserName: "username".tr,
      ),
      Review(
        comment: "glad i bought it ",
        reviewDegree: 4.0,
        dateOfReview: "dateOfReview".tr,
        reviewrUserName: "username".tr,
      ),
    ],
    takeCareInstructions:
        "Place your orchid in bright, indirect light and maintain a temperature between 65-75°F. Water weekly, allowing the medium to dry slightly, and maintain 50-70% humidity. Use orchid fertilizer monthly and repot every 1-2 years with specialized medium. Prune dead blooms and check regularly for pests to keep it healthy.",
  );

  Flower get flowerDetails => _phalaenopsisWhiteOrchidSteamDetails;

  int _selecteColorIndex = 0;

  set selectedColorIndex(int value) {
    _selecteColorIndex = value;

    update();
  }

  int get selectedColorIndex => _selecteColorIndex;

  List<String> availableColorsPreviewImages = [
    "assets/images/fd/small_white_orchidNB.png",
    "assets/images/fd/pinkOrchid_NB.png",
    "assets/images/fd/purple_orchid-NB",
  ];

  changeRatingDegree(
    index,
    newdegeree,
  ) {
    _phalaenopsisWhiteOrchidSteamDetails.reviwes![index].reviewDegree =
        newdegeree;
    update();
  }
}
