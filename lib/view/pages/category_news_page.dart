import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:newsapp_1/model/show_category_news_model.dart';
import 'package:newsapp_1/service/show_category_news.dart';
import 'package:newsapp_1/view/widget/bloc_tile.dart';
import 'package:newsapp_1/view/widget/show_category.dart';

class CategoryNewsPage extends StatefulWidget {
  String name;
  CategoryNewsPage({required this.name, super.key});

  @override
  State<CategoryNewsPage> createState() => _CategoryNewsPageState();
}

class _CategoryNewsPageState extends State<CategoryNewsPage> {
  List<ShowCategoryNews> category = [];
  bool _isloading = true;

  @override
  void initState() {
    showCategoryNews();
    super.initState();
  }

  showCategoryNews() async {
    category = await CategoryData().getCategory(widget.name);
    setState(() {
      _isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isloading
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(
              title: Text(widget.name,
                  style: TextStyle(
                      color: Colors.yellow, fontWeight: FontWeight.bold)),
              centerTitle: true,
              elevation: 0.0,
            ),
            body: Container(
              margin: EdgeInsets.only(right: 10, left: 10),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: category.length,
                  itemBuilder: (context, i) {
                    return ShowCategory(
                      image: category[i].urlToImage!,
                      description: category[i].description!,
                      title: category[i].title!,
                      url: category[i].url!,
                    );
                  }),
            ));
  }
}
