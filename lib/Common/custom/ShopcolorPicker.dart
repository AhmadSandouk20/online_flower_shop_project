import 'package:flutter/material.dart';
import 'dart:math';

import '../../Styles/colors.dart';

class ShopColorPicker extends StatelessWidget {
  final bool selected;
  final Color color;
  final Color? neededBorder;
  final void Function() onTap;
  final BoxConstraints fatherCons;

  const ShopColorPicker({
    super.key,
    this.neededBorder,
    required this.selected,
    required this.color,
    required this.onTap,
    required this.fatherCons,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: min(fatherCons.maxWidth, fatherCons.maxHeight) * 10 / 100,
        height: min(fatherCons.maxWidth, fatherCons.maxHeight) * 10 / 100,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(
            4,
          ),
          border: Border.all(
            color: neededBorder ?? Colors.white,
          ),
        ),
        child: selected
            ? Container(
                width: min(fatherCons.maxWidth, fatherCons.maxHeight) * 3 / 100,
                height:
                    min(fatherCons.maxWidth, fatherCons.maxHeight) * 3 / 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    30,
                  ),
                  color: ShopLightColors.primaryColor,
                ),
              )
            : const SizedBox(),
      ),
    );
  }
}
