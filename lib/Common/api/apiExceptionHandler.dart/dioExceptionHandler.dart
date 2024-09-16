import 'dart:developer';

import 'package:dio/dio.dart';

class ServerException implements Exception {
  final ErrorModel errorModel;
  ServerException(this.errorModel);
}

class ErrorModel {
  final bool success;
  final String message;
  ErrorModel({
    required this.message,
    required this.success,
  });
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      message: jsonData["message"] ?? jsonData["statue message"],
      success: jsonData["success"],
    );
  }
}

void handleExceotion(DioException dioE) {
  switch (dioE.type) {
    case DioExceptionType.badResponse:
      switch (dioE.response!.statusCode) {
        case 200:
          break;
        case 422:
          log("422 error happend");
          break;
        case 403:
          break;
        case 404:
          break;
        case 504:
          break;
      }
    //all but last one occurs on client side before reaching the server
    case DioExceptionType.badCertificate:
      throw ServerException(
        ErrorModel.fromJson(dioE.response!.data),
      );

    case DioExceptionType.connectionError:
      throw ServerException(
        ErrorModel.fromJson(dioE.response!.data),
      );
    case DioExceptionType.connectionTimeout:
      throw ServerException(
        ErrorModel.fromJson(dioE.response!.data),
      );
    case DioExceptionType.receiveTimeout:
      throw ServerException(
        ErrorModel.fromJson(dioE.response!.data),
      );
    case DioExceptionType.sendTimeout:
      throw ServerException(
        ErrorModel.fromJson(dioE.response!.data),
      );
    case DioExceptionType.cancel:
      throw ServerException(
        ErrorModel.fromJson(dioE.response!.data),
      );
    case DioExceptionType.unknown:
      throw ServerException(
        ErrorModel.fromJson(
          dioE.response!.data,
        ),
      );
    //only when reach the server
  }
}
