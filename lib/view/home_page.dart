import 'package:app_consume_api/controller/home_controller.dart';
import 'package:app_consume_api/model/api_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomePage extends StatelessWidget {
  final HomeController _homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    _homeController.getAllData();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Api Data to List"),
      ),
      body: Container(
        color: Colors.white,
        child: Obx(() {
          return _homeController.apiData.value.isNotEmpty
              ? ListView.builder(itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title:
                          Text(_homeController.apiData[index].title.toString()),
                      subtitle:
                          Text(_homeController.apiData[index].id.toString()),
                      leading:
                          Image.network(_homeController.apiData[index].imgUrl),
                    ),
                  );
                })
              : Container();
        }),
      ),
    );
  }
}
