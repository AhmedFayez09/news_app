
import 'package:flutter/material.dart';
import 'package:news_c6/modules/detalis/news_details_screen.dart';
import 'package:news_c6/modules/home/home.dart';
import 'package:news_c6/modules/home/news_fragment.dart';

Map<String, Widget Function(BuildContext) > routes = {
HomeScreen.routeName:(c)=> HomeScreen(),
  NewsDetailsScreen.routeName:(c)=> NewsDetailsScreen(),




};