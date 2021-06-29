import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  Dio dio = new Dio();

  Future<bool> login(email, password) async {
    try {
      final response = await dio.post(
          //'https://onlinelogistic.softshalanepal.com/api/v1/auth/login',
          'https://flutterauth001.herokuapp.com/authenticate',
          data: {"name": email, "password": password},
          options: Options(contentType: Headers.formUrlEncodedContentType));
      if (response.statusCode == 200) {
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
}
