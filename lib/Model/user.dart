import 'package:dio/dio.dart';

class User {
  // late String id;
  late String email;
  late String phoneNumber;
  late String userName;
  late String password;
  late MultipartFile profilePhoto;

  User({
    // required id;
    required this.email,
    required this.userName,
    required this.phoneNumber,
    required this.password,
    required this.profilePhoto,
  });

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    userName = json['userName'];
    password = json['password'];
  }

  dynamic toMultiTypes() {
    final data = {
      'profile_photo': profilePhoto,
      'certificate': "",
      'email': email,
      'phone_number': phoneNumber,
      'password': password,
      'password_confirmation': password,
      'user_name': userName
    };

    return data;
  }
}
