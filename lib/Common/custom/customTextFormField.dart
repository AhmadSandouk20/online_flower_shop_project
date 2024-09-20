import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'dart:developer';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../common/sizeConfig.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  int suffixIcon;
  int enabled;
  bool? isObscure;
  double? maxWidth;
  double? maxHeight;
  bool? labelColor;
  FocusNode? focusNode;
  TextInputType? keyboardType;
  TextInputAction? textInputAction;
  void Function(String)? onFieldSubmitted;
  Future<void> Function()? onTap;
  TextEditingController textEditingController;
  int? maxLines;
  int? maxLength;
  EdgeInsetsGeometry? margin;
  List<TextInputFormatter>? inputFormatters;
  String? Function(String?)? validate;

  String? errorMessage;

  CustomTextFormField({
    this.maxLength,
    required this.label,
    required this.validate,
    errorMessage,
    keyboardType,
    isObscure,
    textInputAction,
    focusNode,
    onFieldSubmitted,
    labelColor,
    maxWidth,
    maxHeight,
    this.enabled = 1,
    this.inputFormatters,
    this.suffixIcon = -1,
    required this.textEditingController,
    this.maxLines,
    onTap,
    this.margin,

    // required Size screenSize
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ??
          EdgeInsets.only(
            top: 20.h,
            left: 30.w,
            right: 30.w,
          ),
      child: TextFormField(
        onChanged: (value) {
          textEditingController.text = value;
        },
        inputFormatters: inputFormatters ?? [],
        onTap: onTap,
        maxLength: maxLength,
        maxLines: maxLines ?? 1,
        keyboardType: keyboardType ?? TextInputType.text,
        obscureText: isObscure ?? false,
        focusNode: focusNode,
        onFieldSubmitted: onFieldSubmitted,
        textInputAction: textInputAction,
        validator:
            validate != null ? (value) => validate!(value) : (value) => null,
        decoration: InputDecoration(
          errorText: errorMessage,

          enabled: enabled == 0 ? false : true,
          constraints: BoxConstraints(
            maxWidth: maxWidth ?? SizeConfig.screenWidth * 90 / 100,
            maxHeight: maxHeight ?? SizeConfig.screenHeight * 10 / 100,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(
            vertical: 5.h,
            horizontal: 15.w,
          ),
          suffixIcon: suffixIcon == 0
              ? Image.asset(
                  "assets/images/SignUp/upload_pdf_file.png",
                )
              : suffixIcon == 1
                  ? const Icon(
                      Icons.search,
                    )
                  : null,
          label: Text(
            label,
          ),
          errorStyle: const TextStyle(
            color: Color(
              0x8C8A8CFF,
            ),
          ),
          // errorText: errorMessage,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(
              7,
            ),
          ),
        ),
      ),
    );
  }
}
