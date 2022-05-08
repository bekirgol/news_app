import 'package:flutter/material.dart';
import 'package:news_app/Models/news.dart';

class NewsDetailPage extends StatelessWidget {
  final Result result;
  const NewsDetailPage({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Card(
                child: Image.network(
                  result.image!,
                  fit: BoxFit.fill,
                  errorBuilder: (context, error, stackTrace) =>
                      Image.asset("assets/images/resim-yok.png"),
                ),
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(5),
                title: Text(result.name!),
                subtitle: Text(result.description!),
              )
            ],
          ),
        ),
      ),
    );
  }
}
