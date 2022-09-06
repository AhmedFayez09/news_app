import 'package:flutter/material.dart';
import 'package:news_c6/models/SourcesModel.dart';
import 'package:news_c6/models/category.dart';
import 'package:news_c6/modules/home/tab_controller.dart';
import 'package:news_c6/shared/network/remote/api_manager.dart';

class NewsFragment extends StatelessWidget {
  static const String routeName = 'news';
CategoryModel categoryModel;
  NewsFragment(this.categoryModel);
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<SourcesModel>(
          future: ApiManager.getSources(categoryModel.id),
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

            var sourseList = snapShot.data?.sources ?? [];
            return TabsController(sourseList);
          });

  }
}
