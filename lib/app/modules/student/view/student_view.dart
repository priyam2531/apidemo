import 'package:apidemo/app/modules/home/controller/home_controller.dart';
import 'package:apidemo/app/modules/student/controller/student_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentsView extends StatelessWidget {
  StudentsView({Key? key}) : super(key: key);

  StudentController studentController = Get.put(StudentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("CRUD Students"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text("Add Students"),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: studentController.name,
                        decoration: InputDecoration(border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: studentController.email,
                        decoration: InputDecoration(border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: studentController.phone,
                        decoration: InputDecoration(border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: studentController.address,
                        decoration: InputDecoration(border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MaterialButton(
                        onPressed: () {
                          studentController.postStudent(
                              email: studentController.email.text,
                              name: studentController.name.text,
                              phoneNumber: studentController.phone.text,
                              address: studentController.address.text);
                          Get.back();
                        },
                        color: Colors.amber,
                        child: const Text("SUBMIT"),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: studentController.student.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () { showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Text("Update Student"),
                              SizedBox(
                                height: 10,
                              ),
                              TextField(
                                controller: studentController.name,
                                decoration: InputDecoration(border: OutlineInputBorder()),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextField(
                                controller: studentController.email,
                                decoration: InputDecoration(border: OutlineInputBorder()),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextField(
                                controller: studentController.phone,
                                decoration: InputDecoration(border: OutlineInputBorder()),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextField(
                                controller: studentController.address,
                                decoration: InputDecoration(border: OutlineInputBorder()),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              MaterialButton(
                                onPressed: () {
                                  studentController.updateStudent(
                                    id: studentController.student[index].sId,
                                    name: studentController.name.text,
                                    email: studentController.email.text,
                                    phoneNumber: studentController.phone.text,
                                    address: studentController.address.text,
                                  );
                                  Get.back();
                                },
                                color: Colors.amber,
                                child: const Text("UPDATE"),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                    // studentController.updateStudent(
                    //     id: studentController.student[index].sId,
                    //     name: studentController.name.text,
                    //     email: studentController.email.text,
                    //     phoneNumber: studentController.phone.text,
                    //     address: studentController.address.text);
                  },
                ),
                title: Text(studentController.student[index].name.toString()),
                subtitle: Text(studentController.student[index].email.toString()),
                trailing: IconButton(
                    onPressed: () {
                      studentController.deleteStudent(studentController.student[index].sId);
                    },
                    icon: Icon(Icons.delete)),
              ),
            );
          },
        ),
      ),
    );
  }
}
