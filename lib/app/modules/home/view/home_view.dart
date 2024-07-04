import 'package:apidemo/app/modules/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Api Demo"),
      ),
      body: Obx(
        () =>  ListView.builder(
          itemCount: homeController.comments.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                  leading:  CircleAvatar(),
                  title: Text(homeController.comments[index].name.toString()),
                  subtitle: Text(homeController.comments[index].email.toString())),
            );
          },
        ),
      ),
    );
  }
}
