import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rest_demo/constants/strings.dart';
import 'package:rest_demo/models/news_info.dart';

class API_Manager {
  Future<Welcome> getNews() async {
    var client = http.Client();
    var newsModel = null;

    var response = await client.get(Uri.parse(Strings.news_url));
    try {
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = jsonDecode(jsonString);

        newsModel = Welcome.fromJson(jsonMap);
      }
    } on Exception {
      return newsModel;
    }
    return newsModel;
  }
}
