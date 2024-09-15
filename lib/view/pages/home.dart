import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newsapp_1/model/article_model.dart';
import 'package:newsapp_1/model/category_model.dart';
import 'package:newsapp_1/model/slider_model.dart';
import 'package:newsapp_1/service/data.dart';
import 'package:newsapp_1/service/news.dart';
import 'package:newsapp_1/service/slider_data.dart';
import 'package:newsapp_1/view/pages/breaking_news.dart';
import 'package:newsapp_1/view/widget/bloc_tile.dart';
import 'package:newsapp_1/view/widget/category.dart';
import 'package:newsapp_1/view/widget/slider_image_Widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> category = [];
  List<SliderModel> slider = [];
  List<ArticleModel> articles = [];
  bool _isloading = true;

  int activeIndex = 0;

  @override
  void initState() {
    category = getCategory();
    getNews();
    getSliderData();
    super.initState();
  }

  getNews() async {
    articles = await NewsData().getData();
    setState(() {
      _isloading = false;
    });
  }

  getSliderData() async {
    slider = await News().getSliderData();
    setState(() {
      // Update the state after fetching slider data
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("K",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            Text("new's",
                style: TextStyle(
                    color: Colors.yellow, fontWeight: FontWeight.bold)),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: _isloading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: SizedBox(
                      height: 110,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: category.length,
                          itemBuilder: (context, i) {
                            return CategoryTile(
                              categoryName: category[i].categoryName,
                              image: category[i].image,
                            );
                          }),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Breaking News!",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AllNews(news: "Breaking")));
                            },
                            child: Text(
                              "View All",
                              style: TextStyle(
                                  color: Colors.yellow,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      )),
                  slider.isEmpty
                      ? Container()
                      : Column(
                          children: [
                            CarouselSlider.builder(
                                itemCount: slider.length,
                                itemBuilder: (context, index, realIndex) {
                                  String? res = slider[index].urlToImage;
                                  String? res1 = slider[index].title;

                                  return buildImage(res1!, index, res!);
                                },
                                options: CarouselOptions(
                                  height: 250,
                                  enlargeCenterPage: true,
                                  enlargeStrategy:
                                      CenterPageEnlargeStrategy.height,
                                  autoPlay: true,
                                  onPageChanged: (index, reason) => {
                                    setState(() {
                                      activeIndex = index;
                                    })
                                  },
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            BuildIndicator(),
                          ],
                        ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Trending News!",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AllNews(news: "Trending")));
                            },
                            child: Text(
                              "View All",
                              style: TextStyle(
                                  color: Colors.yellow,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: articles.length,
                        itemBuilder: (context, i) {
                          return BlocTile(
                              url: articles[i].url!,
                              imageUrl: articles[i].urlToImage!,
                              description: articles[i].description!,
                              title: articles[i].title!);
                        }),
                  )
                ],
              ),
            ),
    );
  }

  Widget buildImage(String name, int index, String image) => sliderWidget(
        name: name,
        image: image,
        index: index,
      );
  Widget BuildIndicator() => Center(
          child: AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: slider.length,
        effect: const SlideEffect(
            dotHeight: 15, dotWidth: 15, activeDotColor: Colors.yellow),
      ));
}
