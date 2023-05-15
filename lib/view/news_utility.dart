import 'package:flutter/material.dart';
import 'package:media_stack/view/article_widget.dart';

import '../model/news_model.dart';

List<Widget> newsDesigns(List<NewsArticle> newsArticles) {
    var widgets = <Widget>[];

    for (var data in newsArticles) {
      var widget = ArticleWidget(
        newsArticle: data,
      );
      widgets.add(widget);
    }

    return widgets;
  }