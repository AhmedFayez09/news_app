import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../models/category.dart';

class CategoryWidget extends StatelessWidget {
  CategoryModel categoryModel;
  int index;
CategoryWidget(this.categoryModel,this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: categoryModel.ColorCode,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
          bottomRight: Radius.circular(index%2==0?0:25),
        bottomLeft  : Radius.circular(index%2!=0?0:25),
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(categoryModel.imageUrl),
          SizedBox(height: 10,),
          Text(categoryModel.title,style: TextStyle(
            color: Colors.white,
            fontSize: 18
          ),),
        ],
      ),
    );
  }
}
