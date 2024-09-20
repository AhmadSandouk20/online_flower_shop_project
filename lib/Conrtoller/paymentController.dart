import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_flower_shop/common/component/selectButton.dart';

class PaymentController extends GetxController {
  String? isEmpty(String? value) {
    if (value == null) {
      return "can't be empty";
    }
    return null;
  }

  bool _methodSelected = true;
  bool _saveForFuture = true;
  bool get saveForFuture => _saveForFuture;

  get methodSelected => _methodSelected;

  set saveForFuture(bool value) {
    _saveForFuture = value;
    update();
  }

  // final firstPageFormKey = GlobalKey<FormState>();
  // final secondPageFormKey = GlobalKey<FormState>();

  final phoneFocusNode = FocusNode();
  final townOrCityFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final addressFocusNode = FocusNode();

  TextEditingController _phoneEditingController = TextEditingController();
  TextEditingController _nameEditingController = TextEditingController();
  TextEditingController _emailEditingController = TextEditingController();
  TextEditingController _townOrCityEditingController = TextEditingController();
  TextEditingController _addressOrCityEditingController =
      TextEditingController();

  get nameEController => _nameEditingController;
  get phoneEController => _phoneEditingController;

  get townOrCityEditingController => _townOrCityEditingController;
  get addressOrCityEditingController => _addressOrCityEditingController;

  get emailEController => _emailEditingController;

  set nameEController(value) {
    _nameEditingController = value;
    update();
  }

  set emailEController(value) {
    _emailEditingController = value;
    update();
  }

  set phoneEController(value) {
    _phoneEditingController = value;
    update();
  }

  set townOrCityController(value) {
    _townOrCityEditingController = value;
    update();
  }

  set addressOrCityEditingController(value) {
    _addressOrCityEditingController = value;
    update();
  }

  get roseImage => "assets/images/Payment/RoseWrapped_Canvas.png";

// ------------------second payment screen

  TextEditingController _cardHolderFullNameEditingController =
      TextEditingController();

  get cardHolderFullNameEditingController =>
      _cardHolderFullNameEditingController;

  set cardHolderFullNameEditingController(value) {
    _cardHolderFullNameEditingController = value;
    update();
  }

  TextEditingController _cardNumberEditingController = TextEditingController();

  get cardNumberEditingController => _cardNumberEditingController;

  set cardNumberEditingController(value) {
    _cardNumberEditingController = value;
    update();
  }

  TextEditingController _cVVEditingController = TextEditingController();

  get cVVEditingController => _cVVEditingController;

  set cVVEditingController(value) {
    _cVVEditingController = value;
    update();
  }

  int _selectedIndex = 0;

  final List<String> _paymentMethods = [
    "Credit Card",
    "Debit Card",
    "Pay Pal",
    "Digital Wallet",
  ];

  List<String> get paymentMethods => [..._paymentMethods];

  get selectedMethodIndex => _selectedIndex;

  selectMethod(
    int index,
  ) {
    _selectedIndex = index;
    update();
  }

  DateTime? _selectedDate;

  set expirationDate(DateTime? selectedate) {
    _selectedDate = selectedate;
    update();
  }

  DateTime? get expirationDate => _selectedDate;
}
