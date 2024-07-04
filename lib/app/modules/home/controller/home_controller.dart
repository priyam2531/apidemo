import 'dart:convert';

import 'package:apidemo/Data/Models/get_comments_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../../Data/Models/user_model.dart';

class HomeController extends GetxController {
  Dio dio = Dio();
  String BASE_URI = "https://jsonplaceholder.typicode.com";
  dynamic data = [].obs;
  var comments = <GetComments>[].obs;
  var users = <UserModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getApiData();
    getUsersApiData();
    super.onInit();
  }

  getApiData() async {
    try {
      final response = await dio.get("$BASE_URI/comments");
      if (response.statusCode == 200) {
        // data.value = response.data;
        var commentList =
            (response.data as List).map((comment) => GetComments.fromJson(comment)).toList();
        comments.value = commentList;
        print("Data:-${comments.length}");
        update();
      }
    } catch (e) {
      print("Error API:-$e");
    }
  }

  getUsersApiData() async {
    try {
      final response = await dio.get("$BASE_URI/users");
      if (response.statusCode == 200) {
        // data.value = response.data;
        var userList =
            (response.data as List).map((comment) => UserModel.fromJson(comment)).toList();
        users.value = userList;
        print("Users:-${users.length}");
        update();
      }
    } catch (e) {
      print("Error API:-$e");
    }
  }
}
