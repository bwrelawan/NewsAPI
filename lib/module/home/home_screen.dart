import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:helpme/module/home/home_controller.dart';
import 'package:helpme/route/route_constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (HomeController homeController) {
          return SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(title: const Text('Categories')),
              body: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4,
                      childAspectRatio: 3 / 2,
                      mainAxisSpacing: 4),
                  itemCount: homeController.category.length,
                  itemBuilder: (BuildContext ctx, index) {
                    var data = homeController.category[index];
                    return InkWell(
                      onTap: () {
                        Get.toNamed(RouteConstant.listArticle,
                            preventDuplicates: false,
                            parameters: {"category_name": data.categoryName});
                      },
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        child: Stack(
                          children: [
                            Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.network(
                                  data.categoryImageUrl,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              color: Colors.white24.withOpacity(0.5),
                            ),
                            Center(
                                child: Text(
                              data.categoryName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ))
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          );
        });
  }
}
