import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpme/module/detail_article/detail_article_controller.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'inappbrowser_screen.dart';

class DetailArticleScreen extends StatelessWidget {
  const DetailArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailArticleController>(
        init: DetailArticleController(),
        builder: (DetailArticleController detailArticleController) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Text(detailArticleController.name),
              ),
              body: detailArticleController.isLoadingDetail
                  ? Center(
                      child: Container(
                        child: LoadingAnimationWidget.flickr(
                          leftDotColor: const Color(0xFF0063DC),
                          rightDotColor: const Color(0xFFFF0084),
                          size: 100,
                        ),
                      ),
                    )
                  : detailArticleController.error != null
                      ? const Center(
                          child: Text('Data not found'),
                        )
                      : ListView.builder(
                          itemCount:
                              detailArticleController.detailArticle.length,
                          itemBuilder: (c, index) {
                            var data =
                                detailArticleController.detailArticle[index];
                            return InkWell(
                              onTap: () {
                                data.url == null
                                    ? null
                                    : Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                InappbrowserScreen(
                                                    data.url ?? "")));
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Image.network(
                                            data.urlToImage ??
                                                "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png",
                                            width: 50,
                                            height: 50,
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 250,
                                              child: Text(
                                                data.title ?? "",
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14),
                                                textAlign: TextAlign.start,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                              ),
                                            ),
                                            data.content == null
                                                ? const SizedBox()
                                                : const SizedBox(
                                                    height: 10,
                                                  ),
                                            data.content == null
                                                ? const SizedBox()
                                                : SizedBox(
                                                    width: 250,
                                                    child: Text(
                                                      data.content ?? "",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                    ),
                                                  ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              children: [
                                                const Text('Author : ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Text(data.author ?? "")
                                              ],
                                            ),
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
