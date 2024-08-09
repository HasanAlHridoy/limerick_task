import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:limerick_task/controller/services/pref_utils.dart';
import 'package:limerick_task/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import 'apis.dart';

class Repositories {
  Future<void> getAuthData(String email, String password) async {
    try {
      final http.Response response = await http.post(
        body: {"email": email, "password": password},
        Uri.parse(Apis.login),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> getAuthData = jsonDecode(response.body);
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('token', getAuthData['token']);
        // await PrefUtils().setAuthToken(getAuthData['token']);
      } else if (response.statusCode == 401) {
        rootScaffoldMessengerKey.currentState!.showSnackBar(const SnackBar(content: Text('Your email or password is incorrect')));
      } else {
        rootScaffoldMessengerKey.currentState!.showSnackBar(const SnackBar(content: Text('Error Happens')));
      }
    } catch (e) {
      debugPrint('${e.toString()} in ${Apis.login}');
      throw Exception(e);
    }
  }

  Future<List<ProductModel>> getProductData() async {
    List<ProductModel> products = [];
    final prefs = await SharedPreferences.getInstance();
    String? authToken = prefs.getString('token');
    print(authToken);
    try {
      final http.Response response = await http.get(
        Uri.parse(Apis.products),
        headers: {
          'Authorization': 'Bearer $authToken',
        },
      );
      if (response.statusCode == 200) {
        products = productModelFromJson(response.body);
        print('gggggggggggggggggg');
        print(products.first.name);
      } else {
        rootScaffoldMessengerKey.currentState!.showSnackBar(const SnackBar(content: Text('Error Happens')));
      }
      return products;
    } catch (e) {
      debugPrint('${e.toString()} in ${Apis.products}');
      throw Exception(e);
    }
  }
}
