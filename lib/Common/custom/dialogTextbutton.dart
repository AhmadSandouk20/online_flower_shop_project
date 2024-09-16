import 'package:flutter/material.dart';

class CustomDialogTextButtonWithIcon {
  static dialogTextButtonWithIcon({
    required String labelText,
    required Icon icon,
    required void Function() onPressed,
  }) {
    return TextButton.icon(
      label: Text(
        labelText,
      ),
      onPressed: onPressed,
      icon: icon,
    );
  }
}
