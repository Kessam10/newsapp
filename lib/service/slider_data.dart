import 'package:dio/dio.dart';
import 'package:newsapp_1/model/slider_model.dart';

class News {
  var dio = Dio();

  List<SliderModel> news = [];

  Future<List<SliderModel>> getSliderData() async {
    String url =
        "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=3e79411d24354d96afe0f39c31ef5ec4";
    try {
      var response = await dio.get(url);
      if (response.statusCode == 200) {
        var jsonData = response.data;
        List<dynamic> data = jsonData['articles'];
        List<SliderModel> emptyList = [];

        for (var i in data) {
          SliderModel sliderModel = SliderModel.fromJson(i);
          emptyList.add(sliderModel);
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
