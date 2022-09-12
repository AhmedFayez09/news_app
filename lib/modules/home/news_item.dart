import 'package:flutter/material.dart';
import 'package:news_c6/models/NewsModel.dart';
import 'package:news_c6/modules/detalis/news_details_screen.dart';

class NewsItem extends StatelessWidget {
  Articles articles;

  NewsItem(this.articles);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          NewsDetailsScreen.routeName,
          arguments:articles ,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: Image.network(
                articles.urlToImage ?? "",
                height: 180,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 5),
            Text(
              articles.author ?? "",
              style: const TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              articles.title ?? "",
              style: Theme.of(context).textTheme.subtitle2,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              articles.publishedAt ?? "",
              textAlign: TextAlign.right,
            )
          ],
        ),
      ),
    );
  }
}
