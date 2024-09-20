import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getP;
import 'package:online_flower_shop/Common/api/apiExceptionHandler.dart/dioExceptionHandler.dart';
import 'package:online_flower_shop/Common/custom/customText.dart';
import 'package:online_flower_shop/constants/shopText.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(
          seconds: 60,
        ),
        receiveTimeout: const Duration(
          seconds: 60,
        ),
        receiveDataWhenStatusError: true,
      ),
    );
    // dio!.interceptors.add(LogInterceptor(
    //   request: true,
    //   responseBody: true,
    //   error: true,
    //   requestBody: true,
    // ));
  }

  static String baseUrl =
      "https://abdulrahman-bashir.trainees-mad-s.com/api/v1/auth";

  static Future<Response> getData({
    required String path,
    required Map<String, dynamic>? query,
  }) async {
    final response = await dio!.get(
      path,
      queryParameters: query,
    );

    if (response.statusCode != 200) {
      return response;
    }
    return response.data;
  }

  static Future<Response<dynamic>?> postData({
    required String path,
    required dynamic bodyData,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool isFormData = false,
  }) async {
    try {
      Response response = await dio!.post(
        baseUrl + path,
        data: isFormData
            ? FormData.fromMap(
                bodyData,
              )
            : bodyData,
        queryParameters: queryParameters,
        options: Options(
          headers: headers ??
              {
                'Content-Type': 'application/json',
              },
        ),
      );
      log(
        "response shape $response",
      );
      return response;
    } on DioException catch (dioE) {
      // handleExceotion(dioE);
      switch (dioE.type) {
        case DioExceptionType.badResponse:
          final List errorMessages = dioE.response!.data["message"];
          getP.Get.dialog(
            AlertDialog(
              title: CustomText(
                text: "Wrong badResponse",
              ),
              content: Column(
                children: errorMessages
                    .map(
                      (
                        message,
                      ) =>
                          CustomText(
                        text: message,
                      ),
                    )
                    .toList(),
              ),
            ),
          );
          break;
        case DioExceptionType.badCertificate:
          getP.Get.dialog(
            AlertDialog(
              title: CustomText(
                text: "Wrong: badCertificate",
              ),
              content: CustomText(
                text: dioE.error.toString(),
              ),
            ),
          );
          break;
        case DioExceptionType.connectionError:
          getP.Get.dialog(
            AlertDialog(
              title: CustomText(
                text: "Wrong: connectionError",
              ),
              content: CustomText(
                text: dioE.error.toString(),
              ),
            ),
          );

          break;
        case DioExceptionType.connectionTimeout:
          getP.Get.dialog(
            AlertDialog(
              title: CustomText(
                text: "Wrong: connectionTimeout",
              ),
              content: CustomText(
                text: dioE.error.toString(),
              ),
            ),
          );
        case DioExceptionType.receiveTimeout:
          getP.Get.dialog(
            AlertDialog(
              title: CustomText(
                text: "Wrong: receiveTimeout",
              ),
              content: CustomText(
                text: dioE.error.toString(),
              ),
            ),
          );
        case DioExceptionType.cancel:
          getP.Get.dialog(AlertDialog(
            title: CustomText(
              text: "Wrong: cancel",
            ),
            content: CustomText(
              text: dioE.error.toString(),
            ),
          ));
        case DioExceptionType.unknown:
          getP.Get.dialog(
            AlertDialog(
              title: CustomText(
                text: "Wrong: unknown",
              ),
              content: CustomText(
                text: dioE.error.toString(),
              ),
            ),
          );
        case DioExceptionType.sendTimeout:
          getP.Get.dialog(
            AlertDialog(
              title: CustomText(
                text: "Wrong: sendTimeout",
              ),
              content: CustomText(
                text: dioE.error.toString(),
              ),
            ),
          );
          break;
      }
    } catch (error) {
      log(
        "error catched " + error.toString(),
      );
    }
    return null;
  }

  // static Future<Response> delete() async {}

  // static Future<Response> update() async {}
}
