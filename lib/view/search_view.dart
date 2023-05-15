import 'package:flutter/material.dart';
import 'package:media_stack/model/news_model.dart';

import '../service/news_service.dart';
import 'news_utility.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  bool isSearching = false;

  var newsArticles = <NewsArticle>[];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(child: searchNewsArticles()),
            ],
          ),
          isSearching? const Center(child: CircularProgressIndicator(),):
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: newsDesigns(newsArticles),
            )
          
        ],
      ),
    );
  }

  TextField searchNewsArticles() {
    return TextField(
        decoration: const InputDecoration(icon: Icon(Icons.search), hintText: 'Search', labelText: 'Search news'),
        onSubmitted: (value) async {
          setState(() {
            isSearching = true;
          });

          newsArticles = await searchNews(value);

          setState(() {
            isSearching = false;
          });
        },
      );
  }
}
