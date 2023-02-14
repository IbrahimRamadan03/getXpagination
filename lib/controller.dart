import 'package:flutter/material.dart';
import 'package:flutter_application_2/main.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  
  List<Model> list = [];
  ScrollController controller = ScrollController();
  int listLength = 6;
  statues stat = statues.done;

  void onInit() {

    generateList();
    addItems();
 
    super.onInit();
  }

  addItems() async {
  
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.position.pixels) {
        
        for (int i = 0; i < 2; i++) { 
          listLength++;
          list.add(Model(name: (listLength).toString()));
     
        }
      }
    });
  }

  generateList() {
  
          Future.delayed(Duration(seconds:4 ),(){
                list = List.generate(
        listLength, (index) => Model(name: (index + 1).toString()));
          });

     
  }
}
enum statues{
  done,loading
}