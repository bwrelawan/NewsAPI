import 'package:get/get.dart';
import 'package:helpme/module/detail_article/detail_article_screen.dart';
import 'package:helpme/route/route_constant.dart';

import '../module/home/home_screen.dart';
import '../module/list_article/list_article_screen.dart';

class AppRoute {
  static final all = [
    GetPage(name: RouteConstant.home, page: () => const HomeScreen()),
    GetPage(
        name: RouteConstant.listArticle, page: () => const ListArticleScreen()),
    GetPage(
        name: RouteConstant.detailArticle,
        page: () => const DetailArticleScreen()),
  ];
}
