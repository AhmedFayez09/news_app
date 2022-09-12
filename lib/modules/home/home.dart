import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_c6/logic/app_provider.dart';
import 'package:news_c6/models/SourcesModel.dart';
import 'package:news_c6/models/category.dart';
import 'package:news_c6/modules/home/category__screen.dart';
import 'package:news_c6/modules/home/drower.dart';
import 'package:news_c6/modules/home/news_fragment.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
      ),
      drawer: HomeDrawer(onMenuItemClicked),
      body:IsSelectedCategory==null ? CategoriesScreen(onClickedItem) : NewsFragment(IsSelectedCategory!),
    );
  }


  onMenuItemClicked(index){
    Navigator.pop(context);

    if(index == HomeDrawer.categorynum){
      IsSelectedCategory= null;
      setState((){});
    }else if(index==HomeDrawer.settingnum){

    }





  }

   Sources? sources;

  CategoryModel? IsSelectedCategory;

onSelectLang(Sources sources){
  var pro = Provider.of<App_Provider>(context);
  pro.lang= sources.language!;
  setState((){});
}

onClickedItem(category){
IsSelectedCategory=category;
setState((){});



}

}
