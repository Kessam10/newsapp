import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp_1/view/pages/detailed_page.dart';

class BlocTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String url;

  BlocTile(
      {required this.imageUrl,
      required this.description,
      required this.title,
      required this.url,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArticleView(blogUrl: url),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          borderRadius: BorderRadius.circular(10),
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                            imageUrl: imageUrl,
                            placeholder: (context, url) => Center(
                                child:
                                    Center(child: CircularProgressIndicator())),
                            errorWidget: (context, url, error) =>
                                Center(child: Icon(Icons.error)),
                          ))),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width / 1.7,
                          child: Text(
                            title,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          )),
                      SizedBox(
                        height: 3,
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 5),
                          width: MediaQuery.of(context).size.width / 1.6,
                          child: Text(
                            description,
                            maxLines: 3,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                                color: Colors.black87),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
