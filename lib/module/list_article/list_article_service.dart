import 'package:helpme/module/home/model/news_model.dart';
import 'package:helpme/module/network/app_network.dart';

class ListArticleService {
  Future<List<Article>> getRepoListArticle({required String category}) async {
    String apiKey = "77ed98bbd98d41a08f36459efa86d56d";
    var url = Uri.parse('https://newsapi.org/v2/top-headlines?category=' +
        category +
        '&apiKey=' +
        apiKey);
    try {
      final res = await AppNetworkClient.get(path: url.toString());
      return List<Article>.from(
          res.data['articles'].map((e) => Article.fromJson(e)));
    } catch (e) {
      rethrow;
    }
  }
}
