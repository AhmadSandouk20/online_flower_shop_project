import 'package:flutter/material.dart';

class CustomRadius{
  static BorderRadius bottomLeftRadius() {
  return const BorderRadius.only(
    bottomLeft: Radius.circular(
      40,
    ),
    bottomRight: Radius.circular(
      12,
    ),
    topLeft: Radius.circular(
      12,
    ),
    topRight: Radius.circular(
      12,
    ),
  );
}

}
