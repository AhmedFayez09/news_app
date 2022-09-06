import 'package:flutter/material.dart';
import 'package:news_c6/models/NewsModel.dart';
import 'package:news_c6/models/SourcesModel.dart';
import 'package:news_c6/modules/home/news_item.dart';
import 'package:news_c6/shared/network/remote/api_manager.dart';

class NewsData extends StatelessWidget {
  Sources sources;

  NewsData(this.sources);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsModel>(
        future: ApiManager.getNewsBySource(sources.id ?? ""),
        builder: (c, snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapShot.hasError) {
            return Column(
              children: [
                Text("Something has Error"),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(onPressed: () {}, child: Text('Try Again'))
              ],
            );
          }
          if ("ok" != snapShot.data?.status) {
            return Column(
              children: [
                Text("Something has Error , not found OK"),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(onPressed: () {}, child: Text('Try Again'))
              ],
            );
          }
          var newsList = snapShot.data?.articles ?? [];
          return ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (c, i) {
                return NewsItem(newsList[i]);
              });
        });
  }
}
