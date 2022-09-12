import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_c6/models/NewsModel.dart';
import 'package:news_c6/models/SourcesModel.dart';
import '../../../core/constant/my_strings.dart';

class ApiManager {
  static Future<SourcesModel> getSources(String category,
      // String lang
      ) async {
    //?apiKey=06662cdccea74f01bf734741f3aa9e19
    var url =
        Uri.https(baseUrl, sources, {
          'apiKey': apiKey,
          "category": category,
          // "language":lang
        });
    var response = await http.get(url);
    try {
      var bodyResponse = response.body;
      var json = jsonDecode(bodyResponse);
      var responseData = SourcesModel.fromJson(json);
      return responseData;
    } catch (e) {

      throw e;
    }
  }

//For Searsh
// static void getNewsBySource(){
//    var url = Uri.https(baseUrl, everyThing,{
// "apiKey":apiKey,
//      "q":"flutter"
//
//    });

  static Future<NewsModel> getNewsBySource(String sourceId) async {
    var url = Uri.https(baseUrl, everyThing, {
      "apiKey": apiKey,
      "sources": sourceId,

    });
    var response = await http.get(url);
    try {
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var newsResponse = NewsModel.fromJson(json);
      return newsResponse;
    } catch (e) {
      throw e;
    }
  }
}
