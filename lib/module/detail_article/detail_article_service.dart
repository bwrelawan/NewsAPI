import 'package:helpme/module/detail_article/model/detail_article_model.dart';
import 'package:helpme/module/network/app_network.dart';

class DetailArticleService {
  Future<List<Detail>> getRepoDetailArticle({required String name}) async {
    String apiKey = "77ed98bbd98d41a08f36459efa86d56d";
    var url = Uri.parse('https://newsapi.org/v2/top-headlines?sources=' +
        name +
        '&apiKey=' +
        apiKey);
    try {
      final res = await AppNetworkClient.get(path: url.toString());
      return List<Detail>.from(
          res.data['articles'].map((e) => Detail.fromJson(e)));
    } catch (e) {
      rethrow;
    }
  }
}
