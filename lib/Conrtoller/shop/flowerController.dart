import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:online_flower_shop/Model/categories.dart';
import "package:flutter/material.dart";
import 'package:online_flower_shop/Styles/colors.dart';
import 'package:online_flower_shop/common/api/dioHelper.dart';

import '../../Model/flower.dart';
import '../../Model/types.dart';
import '../../common/component/selectionTypes.dart';

class FlowerController extends GetxController {
  RxBool isFilter = false.obs;
  RxBool isBestSellers = false.obs;
  RxBool isMostGifted = false.obs;

  int? _screenIndex;

  int? get screenIndex => _screenIndex;

  set screenIndex(int? index) {
    _screenIndex = index;
    update();
  }

  resetAll(bool needUpdate) {
    isFilter.value = false;
    isBestSellers.value = false;
    isMostGifted.value = false;
    if (needUpdate) update();
  }

  bool choice() {
    if (!isFilter.value && !isBestSellers.value && !isMostGifted.value) {
      return false;
    }
    return true;
  }

  showScreen(
    SelectionTypes selectionType,
  ) {
    resetAll(false);

    switch (selectionType) {
      case SelectionTypes.filter:
        isFilter.value = true;
        break;
      case SelectionTypes.bestSellers:
        isBestSellers.value = true;
        break;
      case SelectionTypes.mostGifted:
        isMostGifted.value = true;
        break;
      default:
        break;
    }

    update();
  }

  final List<Map<String, dynamic>> flowerScreensList = [
    {
      "screenName": "filter".tr,
      "selectionType": SelectionTypes.filter,
    },
    {
      "screenName": "mostGifted".tr,
      "selectionType": SelectionTypes.mostGifted,
    },
    {
      "screenName": "bestSellers".tr,
      "selectionType": SelectionTypes.bestSellers,
    },
  ];

  List<int> _flowerNamesSelectedIndexes = [];
  List<int> _flowerCategoriesSelectedIndexes = [];
  int? _selectedPriceIndex;

  set selectedPriceIndex(int? value) {
    _selectedPriceIndex = value;
    update();
  }

  int? get selectedPriceIndex => _selectedPriceIndex;

  toggleSelectedNames(index) {
    if (_flowerNamesSelectedIndexes.contains(index)) {
      _flowerNamesSelectedIndexes.remove(
        index,
      );
    } else {
      _flowerNamesSelectedIndexes.add(
        index,
      );
    }
    update();
  }

  List<int> get selectedNames => _flowerNamesSelectedIndexes;

  toggleSelectedCategories(index) {
    if (_flowerCategoriesSelectedIndexes.contains(index)) {
      _flowerCategoriesSelectedIndexes.remove(
        index,
      );
    } else {
      _flowerCategoriesSelectedIndexes.add(
        index,
      );
    }
    update();
  }

  List<int> get selectedCategories => _flowerCategoriesSelectedIndexes;

// TODO must get from the api
  final List<Flower> _flowers = [
    Flower(
      id: "01",
      name: "Magnolia Bush",
      price: 12,
      availabeColors: [
        Colors.white,
        const Color(0xFFEBA4A4),
      ],
      categoryId: "id0",
      imageUrl: "assets/images/HomePage/Api/Magnolia_Bush.png",
    ),
    Flower(
      id: "02",
      name: "Bliss Orchid",
      price: 15,
      availabeColors: [
        const Color(0xFFCC90C6),
        const Color(0xFFF6E1D8),
        Colors.white,
      ],
      categoryId: "id0",
      imageUrl: "assets/images/HomePage/Api/Bliss_Orchid.png",
    ),
    Flower(
        id: "03",
        name: "Cherry Blossom",
        price: 25,
        availabeColors: [
          const Color(0xFFF6EEF1),
          const Color(0xFFF1E365),
          Colors.white,
        ],
        categoryId: "id0",
        imageUrl: "assets/images/HomePage/Api/Cherry_Blossom.png"),
    Flower(
        id: "04",
        name: "White Orchid",
        price: 30,
        availabeColors: [
          Colors.white,
          const Color(0xFFF6E1D8),
        ],
        categoryId: "id0",
        imageUrl: "assets/images/HomePage/Api/White_Orchid.png"),
    Flower(
      id: "05",
      name: "Magnolia Flower",
      price: 40,
      availabeColors: [
        const Color(
          0xFFCD979C,
        ),
        ShopLightColors.elipseBackgroundColor,
        Colors.white,
      ],
      categoryId: "id0",
      imageUrl: "assets/images/HomePage/Api/Magnolia_Flower.png",
    ),
    Flower(
        id: "06",
        name: "Magnolia Bush",
        price: 37,
        availabeColors: [
          const Color(
            0xFFFEC0C7,
          ),
          const Color(0xFFF3E9F5),
          const Color(0xFFE4CAB5),
        ],
        categoryId: "id0",
        imageUrl: "assets/images/HomePage/Api/Collection_of_Zanbak.png"),
    Flower(
      id: "07",
      name: "Magnolia Bush",
      price: 40,
      availabeColors: [
        Colors.white,
        const Color(0xFFEBA4A4),
      ],
      categoryId: "id0",
      imageUrl: "assets/images/HomePage/Api/Lily.png",
    ),
  ];

  List<Flower> get flowersList => [..._flowers];

  final List<FlowerTypes> _flowerTypes = [
    FlowerTypes(id: "3", name: "Lily"),
    FlowerTypes(id: "1", name: "Roses"),
    FlowerTypes(id: "2", name: "Orchids"),
    FlowerTypes(id: "0", name: "Daises"),
  ];
  final List<Categories> _categories = [
    Categories(id: "id0", name: "Perennials"),
    Categories(id: "id1", name: "Annuals"),
    Categories(id: "id2", name: 'Bulbs'),
    Categories(id: "id3", name: 'Biennials'),
    Categories(id: "id4", name: 'Climbers'),
    Categories(id: "id5", name: 'Shrubs'),
    Categories(id: "id6", name: 'Succulents'),
  ];

  List<Color> _filterColors = [
    Color(
      0xFFEBA4A4,
    ),
    Color(
      0xFFFFFFFF,
    ),
    Color(
      0xFFC89AC4,
    ),
    Color(
      0xFFEBA4A4,
    ),
    Color(
      0xFFA4CDEB,
    ),
    Color(
      0xFF46E943,
    ),
    Color(
      0xFF923984,
    ),
    Color(
      0xFFEE3333,
    ),
  ];

  final List<String> _prices = ["10_30", "30_50", "50_100", "100+"];
  List<FlowerTypes> get flowerTypes => _flowerTypes;
  List<Categories> get categories => _categories;
  List<String> get prices => _prices;
  List<Color> get filterColors => _filterColors;
  late Map<String, dynamic> filteringResults;
  int _selectedFilterColorIndex = -1;

  int get selectedFilterColorIndex => _selectedFilterColorIndex;

  set selectedFilterColorIndex(int value) {
    _selectedFilterColorIndex = value;
    update();
  }

  List<int> _flowerSelectedColor = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
  ];

  List<int> get flowerSelectedColor => _flowerSelectedColor;

  setFlowerSelectedColor(int flowerIndex, int colorIndex) {
    _flowerSelectedColor[flowerIndex] = colorIndex;

    update();
  }

  Future<Map<String, dynamic>>? filter() async {
    filteringResults = {};
    final Map<String, dynamic> query = {};
    final names = [];
    final categories = [];
    String price = "";
    if (_flowerNamesSelectedIndexes.isNotEmpty) {
      for (int i = 0; i < _flowerTypes.length; i++) {
        if (_flowerNamesSelectedIndexes.contains(i)) {
          names.add(_flowerTypes[i].name);
        }
      }
      query.addAll(
        {
          "names": names,
        },
      );
    }
    if (_flowerCategoriesSelectedIndexes.isNotEmpty) {
      for (int i = 0; i < _categories.length; i++) {
        if (_flowerCategoriesSelectedIndexes.contains(i)) {
          categories.add(_categories[i].name);
        }
      }
      query.addAll(
        {
          "categories": categories,
        },
      );
    }
    if (_selectedPriceIndex != null) {
      price = _prices[_selectedPriceIndex!];
      query.addAll(
        {
          "price": price,
        },
      );
    }
    if (query.isEmpty) {
      return {};
    }

    await DioHelper.getData(
      path: "BaseUrl",
      query: query,
    ).then(
      (
        res,
      ) {
        if (res.statusCode == 200) {
          // json.decode();
          // fill
          // filteringResults.addAll();
          return filteringResults;
        }
      },
    );
    return {};
  }
}
