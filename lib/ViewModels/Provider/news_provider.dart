import 'package:flutter/cupertino.dart';
import 'package:news_app/Interface/news_manager.dart';
import 'package:news_app/Services/news_service.dart';

import '../../Models/news.dart';

// ignore: constant_identifier_names
enum PageState { LOADING, SUCCES, ERROR, IDLE }

class NewsProvider with ChangeNotifier {
  String errorMessage = "";
  News? news;
  late NewsManager newsManager;
  PageState? _state;
  PageState? get state => _state;
  set state(PageState? value) {
    _state = value;
    notifyListeners();
  }

  NewsProvider() {
    newsManager = NewsService();
    _state = PageState.IDLE;
    fetcNews();
  }

  Future<void> fetcNews() async {
    try {
      state = PageState.LOADING;
      news = await newsManager.getNews();
      state = PageState.SUCCES;
    } catch (e) {
      errorMessage = e.toString();
      state = PageState.ERROR;
    }
  }
}
