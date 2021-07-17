import 'package:dio/dio.dart';
import 'package:driver_app/Models/dashboardDetails.dart';
import 'package:driver_app/Models/user.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart'
    as securestorage;

class ApiService {
  securestorage.FlutterSecureStorage _flutterSecureStorage =
      securestorage.FlutterSecureStorage();
  Dio dio = new Dio();

  final String baseApi = "https://onlinelogistic.khanaldipes.com.np";
  Future<bool> login(email, password) async {
    try {
      final response = await dio.post(baseApi + '/api/v1/auth/login',
          data: {"username": email, "password": password},
          options: Options(contentType: Headers.formUrlEncodedContentType));
      var userresponse = response.data;
      // print(userresponse["payload"]["access_token"]);
      if (response.statusCode == 200) {
        _flutterSecureStorage.write(
            key: "access_token",
            value: userresponse["payload"]["access_token"]);

        return true;
      }
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 18.0);
    }
  }

  Future<User> userdetails() async {
    try {
      var accesstoken = await _flutterSecureStorage.read(key: "access_token");

      //final String token = await storage.FlutterSecureStorage().read(key: "token_access").toString();

      final String userDetailsUrl = baseApi + "/api/v1/admin/user";
      var resp = await dio.get(userDetailsUrl,
          options: Options(headers: {"authorization": "bearer $accesstoken"}));

      print(resp.data);
      print("Response aayo");
      if (resp.statusCode == 200) {
        var data = resp.data;

        return User.fromJson(data);
      }
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 18.0);
    }
  }

  Future<DashboardDetails> dashboarddetails() async {
    try {
      var accesstoken = await _flutterSecureStorage.read(key: "access_token");
      final String dashboardUrl = baseApi + "api/v1/admin/dashboard";
      var resp = await dio.get(dashboardUrl,
          options: Options(headers: {"authorization": "bearer $accesstoken"}));
      if (resp.statusCode == 200) {
        var data = resp.data;
        return DashboardDetails.fromJson(data);
      }
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 18.0);
    }
  }
}
