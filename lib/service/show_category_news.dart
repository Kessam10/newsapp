import 'package:dio/dio.dart';
import 'package:newsapp_1/model/show_category_news_model.dart';

class CategoryData {
  var dio = Dio();
  List<ShowCategoryNews> ShowCategory = [];

  Future<List<ShowCategoryNews>> getCategory(String category) async {
    var response = await dio.get(
        'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=3e79411d24354d96afe0f39c31ef5ec4');

    try {
      if (response.statusCode == 200) {
        var jsonData = response.data;

        List<dynamic> data = jsonData['articles'];
        List<ShowCategoryNews> emptyList = [];

        for (var i in data) {
          ShowCategoryNews showCategoryNews = ShowCategoryNews.fromJson(i);
          emptyList.add(showCategoryNews);
        }

        return emptyList;
      } else {
        print("status code = ${response.statusCode}");
      }
    } catch (e) {
      print(e);
    }

    return List.empty();
  }
}
