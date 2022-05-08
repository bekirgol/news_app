import 'package:news_app/Models/news.dart';

abstract class NewsManager {
  Future<News> getNews();
}
