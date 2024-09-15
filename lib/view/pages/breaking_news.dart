import 'package:flutter/material.dart';
import 'package:newsapp_1/model/article_model.dart';
import 'package:newsapp_1/model/slider_model.dart';
import 'package:newsapp_1/service/news.dart';
import 'package:newsapp_1/service/slider_data.dart';
import 'package:newsapp_1/view/widget/news.dart';
import 'package:newsapp_1/view/widget/show_category.dart';

class AllNews extends StatefulWidget {
  String news;
  AllNews({required this.news, super.key});

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  List<SliderModel> slider = [];
  List<ArticleModel> articles = [];
  bool _isloading = true;

  getNews() async {
    articles = await NewsData().getData();
    setState(() {
      _isloading = false;
    });
  }

  @override
  void initState() {
    getNews();
    getSliderData();
    super.initState();
  }

  getSliderData() async {
    slider = await News().getSliderData();
    setState(() {
      _isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.news + " New's",
            style:
                TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: _isloading == true
          ? Center(child: CircularProgressIndicator())
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: widget.news == "Breaking"
                      ? slider.length
                      : articles.length,
                  itemBuilder: (context, i) {
                    return AllNewsSection(
                      image: widget.news == "Breaking"
                          ? slider[i].urlToImage!
                          : articles[i].urlToImage!,
                      description: widget.news == "Breaking"
                          ? slider[i].description!
                          : articles[i].description!,
                      title: widget.news == "Breaking"
                          ? slider[i].title!
                          : articles[i].title!,
                      url: widget.news == "Breaking"
                          ? slider[i].url!
                          : articles[i].url!,
                    );
                  }),
            ),
    );
  }
}
