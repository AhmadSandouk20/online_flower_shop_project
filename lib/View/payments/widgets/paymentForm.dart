import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_flower_shop/Conrtoller/paymentController.dart';
import 'package:online_flower_shop/Styles/fonts.dart';
import 'package:online_flower_shop/common/component/datePicker.dart';
import 'package:online_flower_shop/common/component/selectButton.dart';
import 'package:online_flower_shop/common/custom/customMaterialButton.dart';
import 'package:online_flower_shop/common/custom/customText.dart';
import 'package:intl/intl.dart' as intl;

import '../../../../Styles/colors.dart';
import '../../../Styles/themes/themes.dart';
import '../../../../common/custom/customTextFormField.dart';

class PaymentForm extends StatelessWidget {
  final BuildContext context;
  final PaymentController paymentController;
  final int pageNumber;
  BoxConstraints? constraints;

  PaymentForm({
    required this.context,
    required this.paymentController,
    required this.pageNumber,
    this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      // key: pageNumber == 1
      //     ? paymentController.firstPageFormKey
      //     : paymentController.secondPageFormKey,
      child: pageNumber == 1
          ? firstPaymentscreen(
              context,
              paymentController,
            )
          : secondPaymentscreen(
              context,
              paymentController,
              constraints,
            ),
    );
  }
}

Widget firstPaymentscreen(context, controller) => Column(
      children: [
        CustomTextFormField(
          label: "name".tr,
          textEditingController: controller.nameEController,
          onFieldSubmitted: (_) {
            FocusScope.of(context).requestFocus(
              controller.phoneFocusNode,
            );
          },
          textInputAction: TextInputAction.next,
        ),
        CustomTextFormField(
          label: "phoneNumber".tr,
          focusNode: controller.phoneFocusNode,
          textEditingController: controller.phoneEController,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (_) {
            FocusScope.of(context).requestFocus(
              controller.emailFocusNode,
            );
          },
          keyboardType: TextInputType.number,
        ),
        CustomTextFormField(
          label: "email".tr,
          textEditingController: controller.emailEController,
          focusNode: controller.emailFocusNode,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (_) {
            FocusScope.of(context).requestFocus(
              controller.townOrCityFocusNode,
            );
          },
          keyboardType: TextInputType.emailAddress,
        ),
        CustomTextFormField(
          label: "townOrCity".tr,
          textEditingController: controller.townOrCityEditingController,
          focusNode: controller.townOrCityFocusNode,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (_) {
            FocusScope.of(context).requestFocus(
              controller.addressFocusNode,
            );
          },
        ),
        CustomTextFormField(
          label: "address".tr,
          textEditingController: controller.addressOrCityEditingController,
          focusNode: controller.addressFocusNode,
          textInputAction: TextInputAction.done,
          maxLines: 3,
        ),
      ],
    );

Widget secondPaymentscreen(
  context,
  PaymentController paymentController,
  constraints,
) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GetBuilder<PaymentController>(
          builder: (context) {
            return Wrap(
              runSpacing: constraints.maxHeight * 2 / 100,
              spacing: constraints.maxWidth * 3 / 100,
              children: List.generate(
                paymentController.paymentMethods.length,
                (index) => SelectButton(
                  label: paymentController.paymentMethods[index],
                  index: index,
                  selected: paymentController.selectedMethodIndex == index
                      ? true
                      : false,
                  onPressed: () {
                    paymentController.selectMethod(
                      index,
                    );
                  },
                  selectedBackgroundColor: ShopLightColors.primaryColor,
                  selectedTextColor: Colors.white,
                  textColor: ShopLightColors.primaryColor,
                  backgroundColor: Colors.white,
                  constraints: constraints,
                ),
              ),
            );
          },
        ),
        SizedBox(
          height: constraints.maxHeight * 2 / 100,
        ),
        CustomText(
          text: "cardInfo".tr,
          color: ShopLightColors.primaryColor,
          fontSize: 15.w,
        ),
        SizedBox(
          height: constraints.maxHeight * 2 / 100,
        ),
        CustomText(
          text: "cardHolderName".tr,
          fontFamily: ShopFonts.roboto,
          fontWeight: FontWeight.w400,
          fontSize: 15.w,
        ),
        CustomTextFormField(
          label: "",
          textEditingController:
              paymentController.cardHolderFullNameEditingController,
          isObscure: true,
          margin: EdgeInsets.only(
            top: 10.h,
          ),
        ),
        SizedBox(
          height: constraints.maxHeight * 2 / 100,
        ),
        CustomText(
          text: "cardNumber".tr,
          fontFamily: ShopFonts.roboto,
          fontWeight: FontWeight.w400,
          fontSize: 15.w,
        ),
        CustomTextFormField(
          keyboardType: TextInputType.number,
          label: "",
          textEditingController: paymentController.cardNumberEditingController,
          isObscure: true,
          margin: EdgeInsets.only(
            top: 10.h,
          ),
        ),
        SizedBox(
          height: constraints.maxHeight * 2 / 100,
        ),
        SizedBox(
          width: constraints.maxWidth,
          child: Row(
            children: [
              SizedBox(
                width: constraints.maxWidth * 40 / 100,
                child: Column(
                  children: [
                    SizedBox(
                      width: constraints.maxWidth * 40 / 100,
                      child: CustomText(
                        text: "expirationDate".tr,
                        fontFamily: ShopFonts.roboto,
                        fontWeight: FontWeight.w400,
                        fontSize: 15.w,
                      ),
                    ),
                    InkWell(
                      child: Container(
                        width: constraints.maxWidth * 40 / 100,
                        height: 43.h,
                        margin: EdgeInsets.only(
                          top: 10.h,
                          right: 20.w,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            8,
                          ),
                        ),
                        child: Center(
                          child: GetBuilder<PaymentController>(
                            builder: (context) {
                              return Text(
                                paymentController.expirationDate != null
                                    ? intl.DateFormat('M/d').format(
                                        paymentController.expirationDate!)
                                    : "${DateTime.now().month}/${DateTime.now().day}",
                              );
                            },
                          ),
                        ),
                      ),
                      onTap: () async {
                        await showDatePicker(
                          context: context,
                          firstDate: DateTime(
                            2018,
                          ),
                          lastDate: DateTime.now(),
                        ).then(
                          (
                            pickedDate,
                          ) {
                            if (pickedDate != null) {
                              paymentController.expirationDate = pickedDate;
                              log(
                                "pickedDate $pickedDate",
                              );
                            }
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: constraints.maxWidth * 40 / 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "CVV",
                      fontFamily: ShopFonts.roboto,
                      fontWeight: FontWeight.w400,
                      fontSize: 15.w,
                    ),
                    CustomTextFormField(
                      label: "",
                      textEditingController:
                          paymentController.cVVEditingController,
                      isObscure: true,
                      maxWidth: constraints.maxWidth * 40 / 100,
                      margin: EdgeInsets.only(
                        top: 10.h,
                        right: 20.w,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: constraints.maxHeight * 5 / 100,
        ),
        CustomText(
          fontSize: 15.w,
          text: "futurePurshace".tr,
          fontFamily: ShopFonts.roboto,
          fontWeight: FontWeight.w400,
        ),
        GetBuilder<PaymentController>(
          builder: (context) {
            return LayoutBuilder(
              builder: (context, cons) {
                return SizedBox(
                  width: constraints.maxWidth,
                  child: Row(
                    children: [
                      SizedBox(
                        width: cons.maxWidth * 40 / 100,
                        child: RadioListTile(
                          title: CustomText(
                            text: "yes".tr,
                            fontSize: 15.w,
                            fontWeight: FontWeight.w400,
                            fontFamily: ShopFonts.roboto,
                          ),
                          value: true,
                          groupValue: paymentController.saveForFuture,
                          onChanged: (
                            value,
                          ) {
                            paymentController.saveForFuture = value!;
                          },
                          splashRadius: 0,
                        ),
                      ),
                      SizedBox(
                        width: cons.maxWidth * 35 / 100,
                        child: RadioListTile(
                          contentPadding: EdgeInsets.zero,
                          splashRadius: 0,
                          overlayColor: WidgetStateProperty.all<Color?>(
                            Colors.white,
                          ),
                          title: CustomText(
                            text: "no".tr,
                            fontSize: 15.w,
                            fontWeight: FontWeight.w400,
                            fontFamily: ShopFonts.roboto,
                          ),
                          value: false,
                          groupValue: paymentController.saveForFuture,
                          onChanged: (
                            value,
                          ) {
                            paymentController.saveForFuture = value!;
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
        SizedBox(
          height: constraints.maxHeight * 2 / 100,
        ),
        Center(
          child: CustomMaterialbutton(
            buttonText: "continue".tr,
            onPressed: () {},
            textColor: Colors.white,
            backgroundColor: ShopLightColors.primaryColor,
          ),
        ),
        SizedBox(
          height: constraints.maxHeight * 2 / 100,
        ),
      ],
    );
