import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpme/module/list_article/list_article_controller.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../route/route_constant.dart';

class ListArticleScreen extends StatelessWidget {
  const ListArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListArticleController>(
        init: ListArticleController(),
        builder: (ListArticleController listArticleController) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Text(listArticleController.categoryName),
              ),
              body: listArticleController.isLoadingListCategory
                  ? Center(
                      child: Container(
                        child: LoadingAnimationWidget.flickr(
                          leftDotColor: const Color(0xFF0063DC),
                          rightDotColor: const Color(0xFFFF0084),
                          size: 100,
                        ),
                      ),
                    )
                  : listArticleController.error != null
                      ? const Center(
                          child: Text('Data not found'),
                        )
                      : ListView.builder(
                          itemCount: listArticleController.article.length,
                          itemBuilder: (c, index) {
                            return InkWell(
                              onTap: () {
                                Get.toNamed(RouteConstant.detailArticle,
                                    preventDuplicates: false,
                                    parameters: {
                                      "name": listArticleController
                                              .article[index].source?.id ??
                                          ""
                                    });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          listArticleController
                                                  .article[index].title ??
                                              "",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                          textAlign: TextAlign.start,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(listArticleController
                                                .article[index].content ??
                                            ""),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          children: [
                                            const Text('Source : ',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(listArticleController
                                                    .article[index]
                                                    .source
                                                    ?.id ??
                                                "")
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
            ),
          );
        });
  }
}
