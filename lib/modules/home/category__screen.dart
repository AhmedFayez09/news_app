import 'package:flutter/material.dart';
import 'package:news_c6/models/category.dart';
import 'package:news_c6/modules/home/category_widget.dart';

class CategoriesScreen extends StatelessWidget {
  var categories = CategoryModel.getCategories();
  var onClickedItem;

  CategoriesScreen(this.onClickedItem);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Text(
            'Pick Your Category \n of interset',
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(
            height: 35,
          ),
          Expanded(
            child: GridView.builder(
                itemCount: categories.length,
                gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemBuilder: (c, i) {
                  return InkWell(
                      onTap: (){
                        onClickedItem(categories[i]);
                      },
                      child: CategoryWidget(categories[i], i));
                }),
          )
        ],
      ),
    );
  }
}
