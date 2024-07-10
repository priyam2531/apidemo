import 'package:apidemo/Data/Models/student_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class StudentController extends GetxController{
  Dio dio = Dio();
  String BASE_URI = "http://192.168.29.40:5000";
  dynamic data = [].obs;
  var student = <StudentModel>[].obs;
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    getStudentData();
    super.onInit();
  }

  getStudentData() async {
    try {
      final response = await dio.get("${BASE_URI}/student");
      if (response.statusCode == 200) {
        // data.value = response.data;
        var studentList =
        (response.data as List).map((comment) => StudentModel.fromJson(comment)).toList();
        student.value = studentList;
        print("student data:-${student.length}");
        update();

      }
    } catch (e) {
      print("Error API:-$e");
    }
  }

  postStudent({name, email, phoneNumber, address}) async {
    try{
      final response = await dio.post("${BASE_URI}/post-student",data: {
        "email":email,
        "name":name,
        "phone":phoneNumber,
        "address":address
      });

      if(response.statusCode == 201){
        getStudentData();
        update();
      }
    }catch(e){
      print("Error students:- $e");
    }
  }

}