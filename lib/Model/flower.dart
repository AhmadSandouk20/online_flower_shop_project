import 'package:flutter/widgets.dart';

import 'review.dart';

class Flower {
  late String id;
  late String name;
  late int price;
  late List<Color> availabeColors;
  late String categoryId;
  // TODO must be a url
  late String imageUrl;
  String? inforamtion;
  String? takeCareInstructions;
  List<Review>? reviwes;

  Flower({
    required this.id,
    required this.name,
    required this.price,
    required this.availabeColors,
    required this.categoryId,
    required this.imageUrl,
    this.inforamtion,
    this.reviwes,
    this.takeCareInstructions,
  });

  Flower.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    id = json['id'];
    availabeColors = json["availabeColors"];
    imageUrl = json["imageUrl"];
    categoryId = json["categoryId"];
  }
  Flower.fromJsonWithDetails(Map<String, dynamic> json) {
    Flower.fromJson(json);
    inforamtion = json['inforamtion'];
    takeCareInstructions = json['takeCareInstructions'];
    reviwes = json['reviews'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['price'] = price;
    data['id'] = id;
    data['availabeColors'] = availabeColors;
    data['categoryId'] = categoryId;
    data['imageUrl'] = imageUrl;
    return data;
  }
}
