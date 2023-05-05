import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:helpme/module/home/model/news_model.dart';
import 'package:helpme/module/list_article/list_article_service.dart';

class ListArticleController extends GetxController with ListArticleService {
  bool isLoadingListCategory = false;
  String categoryName = "";
  List<Article> article = [];
  String? error;

  @override
  void onInit() {
    categoryName = Get.parameters['category_name'] ?? "";
    getListArticle();

    super.onInit();
  }

  getListArticle() async {
    try {
      article = [];
      isLoadingListCategory = true;
      update();

      final res = await getRepoListArticle(category: categoryName);
      article.addAll(res);

      isLoadingListCategory = false;
      update();
    } on DioError catch (e) {
      error = e.response?.data['message'];
      isLoadingListCategory = false;
      update();
    } catch (e) {
      error = e.toString();
      isLoadingListCategory = false;
      update();
    }

    update();
  }
}
