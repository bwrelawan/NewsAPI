import 'package:get/get.dart';
import 'package:helpme/module/home/home_service.dart';
import 'package:helpme/module/home/model/category_model.dart';

class HomeController extends GetxController with HomeService {
  List<CategoryModel> category = [
    CategoryModel(
        categoryImageUrl: 'https://picsum.photos/250?image=1',
        categoryName: 'business'),
    CategoryModel(
        categoryImageUrl: 'https://picsum.photos/250?image=2',
        categoryName: 'sports'),
    CategoryModel(
        categoryImageUrl: 'https://picsum.photos/250?image=3',
        categoryName: 'entertainment'),
    CategoryModel(
        categoryImageUrl: 'https://picsum.photos/250?image=4',
        categoryName: 'general'),
    CategoryModel(
        categoryImageUrl: 'https://picsum.photos/250?image=5',
        categoryName: 'health'),
    CategoryModel(
        categoryImageUrl: 'https://picsum.photos/250?image=6',
        categoryName: 'science'),
    CategoryModel(
        categoryImageUrl: 'https://picsum.photos/250?image=7',
        categoryName: 'technology'),
  ];
}
