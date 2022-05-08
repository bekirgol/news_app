import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final String name;
  final String imgUrl;
  final Function()? function;

  const NewsCard(
      {Key? key, required this.name, required this.imgUrl, this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: InkWell(
          onTap: function,
          child: Column(
            children: [
              Expanded(flex: 2, child: Text(name)),
              Expanded(
                flex: 8,
                child: Image.network(
                  imgUrl,
                  fit: BoxFit.fill,
                  errorBuilder: (context, error, stackTrace) =>
                      Image.asset("assets/images/resim-yok.png"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
