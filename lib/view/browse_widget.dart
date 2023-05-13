import 'package:flutter/material.dart';
import 'package:native_webview/native_webview.dart';

import '../model/news_model.dart';

class BrowserWidget extends StatelessWidget {
  BrowserWidget({Key? key, required this.newsArticle}) : super(key: key);
  NewsArticle? newsArticle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
            child: Text(
                newsArticle!.author != null ? newsArticle!.author! : 'J LOHITH',
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          automaticallyImplyLeading: false),
      body: WebView(
        initialUrl: newsArticle!.url,
      ),
    );
  }
}
