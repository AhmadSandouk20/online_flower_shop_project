import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Model/flower.dart';

class Homepagecontroller extends GetxController {
  get categoriesImage => "assets/images/HomePage/categories.png";

  List<Flower> bestSellersFlowers = [
    Flower(
      id: "0",
      name: "Faux Eyebrow leaf",
      price: 25,
      availabeColors: [
        Color(
          0xFFFFFFFF,
        ),
      ],
      categoryId: "categoryId",
      imageUrl: "assets/images/HomePage/Api/homePage.png",
    ),
    Flower(
      id: "1",
      name: "Dendrobium Lasting Orchids",
      price: 38,
      availabeColors: [
        Color(
          0xFFFFFFFF,
        ),
      ],
      categoryId: "categoryId",
      imageUrl: "assets/images/HomePage/Api/homePage1.png",
    ),
  ];
  // Flower
}
