import 'package:newsapp_1/model/article_model.dart';
import 'package:dio/dio.dart';

class NewsData {
  var dio = Dio();

  List<ArticleModel> news = [];

  Future<List<ArticleModel>> getData() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=eg&apiKey=3e79411d24354d96afe0f39c31ef5ec4";
    try {
      var response = await dio.get(url);
      if (response.statusCode == 200) {
        var jsonData = response.data;
        List<dynamic> data = jsonData['articles'];
        List<ArticleModel> emptyList = [];

        for (var i in data) {
          ArticleModel articleModel = ArticleModel.fromJson(i);
          emptyList.add(articleModel);
        }
        return emptyList;
      } else {
        print("error status code is ${response.statusCode}");
      }
    } catch (ex) {
      print(ex);
    }
    return List.empty();
  }
}
