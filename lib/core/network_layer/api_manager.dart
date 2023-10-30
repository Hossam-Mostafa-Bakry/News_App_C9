import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_c9_mon_4pm/core/constants.dart';
import 'package:news_app_c9_mon_4pm/models/articals_model.dart';
import 'package:news_app_c9_mon_4pm/models/source_model.dart';

class ApiManager {


  static Future<SourceModel> fetchSource(String categoryId) async {
    Map<String, dynamic> queryParameters = {
      "apiKey": Constants.apiKey,
      "category": categoryId,
    };

    Uri uri = Uri.https(
      Constants.baseURL,
      "/v2/top-headlines/sources",
      queryParameters,
    );

    var response = await http.get(uri);
    SourceModel sourceModel = SourceModel.fromJson(jsonDecode(response.body));
    return sourceModel;

    // parse Json to Dart Object
  }


  static Future<ArticalsModel> fetchArticals(String sourceId) async {
    Map<String, dynamic> queryParameters = {
      "apiKey": Constants.apiKey,
      "sources": sourceId,
      // "q" : "barcelona"
    };

    Uri uri = Uri.https(
      Constants.baseURL,
      "/v2/top-headlines",
      queryParameters,
    );

    var response = await http.get(uri);

    ArticalsModel articalsModel = ArticalsModel.fromJson(jsonDecode(response.body));
    return articalsModel;

    // parse Json to Dart Object
  }


}
