import 'package:flutter/material.dart';
import 'package:news_app/ViewModels/Provider/news_provider.dart';
import 'package:news_app/Views/Pages/news.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NewsProvider>(
          create: (_) => NewsProvider(),
        )
      ],
      child: const MaterialApp(
        title: 'Material App',
        home: NewsPage(),
      ),
    );
  }
}
