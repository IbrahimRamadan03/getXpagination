import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/controller.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(
        title: "Pagination",
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
 String title;

  MyHomePage({
   required this.title,
  });
  

  HomePageController homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: GetBuilder(
        init: homePageController,
        builder: (value) => ListView.builder(
          controller: value.controller,
          itemCount: value.list.length,
          itemBuilder: (context, index) {
            return  Padding(
              padding: const EdgeInsets.all(8.0),
              child:Container(
                color: Colors.red,
                height: 100,
                child: Center(
                  child: Text(value.list[index].name),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Model {
  String name;

  Model({
   required this.name,
  });
}