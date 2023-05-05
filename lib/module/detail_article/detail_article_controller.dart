import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:helpme/module/detail_article/detail_article_service.dart';
import 'package:helpme/module/detail_article/model/detail_article_model.dart';

class DetailArticleController extends GetxController with DetailArticleService {
  bool isLoadingDetail = false;
  String name = "";
  String? error;
  List<Detail> detailArticle = [];

  @override
  void onInit() {
    name = Get.parameters['name'] ?? "";
    getDetailArticle();

    super.onInit();
  }

  getDetailArticle() async {
    try {
      detailArticle = [];
      isLoadingDetail = true;
      update();

      final res = await getRepoDetailArticle(name: name);
      detailArticle.addAll(res);

      isLoadingDetail = false;
      update();
    } on DioError catch (e) {
      error = e.response?.data['message'];
      isLoadingDetail = false;
      update();
    } catch (e) {
      error = e.toString();
      isLoadingDetail = false;
      update();
    }

    update();
  }
}
