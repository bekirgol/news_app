import 'dart:io';

import 'package:news_app/Interface/news_manager.dart';
import 'package:news_app/Models/news.dart';
import 'package:http/http.dart' as http;

class NewsService implements NewsManager {
  @override
  Future<News> getNews() async {
    String url =
        "https://api.collectapi.com/news/getNews?country=tr&tag=general&padding=5";
    final response = await http.get(Uri.parse(url), headers: {
      "authorization": "apikey 2eCvY8zJFkAcaoZ9dQoOsw:06MIvg2PQlZPLQvuh8fY7T",
      "content-type": "application/json",
    });

    if (response.statusCode == HttpStatus.ok) {
      return newsFromJson(response.body);
    }

    throw response.body;
  }
}
