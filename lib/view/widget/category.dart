import 'package:flutter/material.dart';
import 'package:newsapp_1/view/pages/category_news_page.dart';

class CategoryTile extends StatelessWidget {
  String categoryName;
  String image;

  CategoryTile({required this.categoryName, required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryNewsPage(name: categoryName)));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                fit: BoxFit.cover,
                image,
                width: 120,
                height: 80,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black38,
              ),
              height: 80,
              width: 120,
              child: Center(
                child: Text(
                  categoryName,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
