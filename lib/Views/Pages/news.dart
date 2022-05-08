import 'package:flutter/material.dart';
import 'package:news_app/ViewModels/Provider/news_provider.dart';
import 'package:news_app/Views/Pages/news_detail.dart';
import 'package:news_app/Views/Widgets/news_card.dart';
import 'package:provider/provider.dart';

import '../../Models/news.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var newsProvider = Provider.of<NewsProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        // appBar: AppBar(
        //   title: Text('Material App Bar'),
        // ),
        body: buildBody(newsProvider),
      ),
    );
  }

  Widget buildBody(NewsProvider newsProvider) {
    switch (newsProvider.state) {
      case PageState.SUCCES:
        {
          return ListView.builder(
            itemCount: newsProvider.news?.result?.length,
            itemBuilder: (BuildContext context, int index) {
              List<Result>? result = newsProvider.news?.result;
              return NewsCard(
                name: result![index].name!,
                imgUrl: result[index].image!,
                function: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => NewsDetailPage(result: result[index]),
                    ),
                  );
                },
              );
            },
          );
        }

      case PageState.LOADING:
        {
          return const Center(child: CircularProgressIndicator());
        }

      case PageState.ERROR:
        {
          return Center(
            child: Text(newsProvider.errorMessage),
          );
        }

      default:
        {
          return const SizedBox.shrink();
        }
    }
  }
}
