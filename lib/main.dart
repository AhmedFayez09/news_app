import 'package:flutter/material.dart';
import 'package:news_c6/core/constant/my_theme.dart';
import 'package:news_c6/core/utils/app_router.dart';
import 'package:news_c6/logic/app_provider.dart';
import 'package:news_c6/modules/home/home.dart';
import 'package:news_c6/modules/home/news_fragment.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (c) => App_Provider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: routes,
      theme: MyThemeData.lightTheme,
      themeMode: ThemeMode.light,
    );
  }
}
