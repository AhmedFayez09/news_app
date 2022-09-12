import 'package:flutter/foundation.dart';

class App_Provider extends ChangeNotifier{

  bool isChach = false;
  String lang = 'en';
  void changeAppChach(bool chech) {
    isChach = chech;
    notifyListeners();
  }
  void changeAppLang(String local){
    lang=local;
    notifyListeners();
  }

}