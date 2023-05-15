import 'dart:convert';
import 'dart:io';

import 'package:media_stack/model/news_model.dart';
import 'package:path_provider/path_provider.dart';

const fileName = 'Bookmarks.json';

Future<String> getPath() async {
  var directory = await getExternalStorageDirectory();
  var path = '${directory!.path}/$fileName';
  return path;
}

Future<List<NewsArticle>> readBookmarks() async {
  var filePath = await getPath();

  var articles = <NewsArticle>[];

  var fileObj = File(filePath);
  if (fileObj.existsSync()) {
    var jsonString = fileObj.readAsStringSync();
    var articlesJson = jsonDecode(jsonString);

    for (var articleJson in articlesJson) {
      var articleObj = NewsArticle.fromJson(articleJson);
      articles.add(articleObj);
    }
  }

  return articles;
}

Future writeBookmarks(List<NewsArticle> articles) async {
  var filePath = await getPath();
  var fileObj = File(filePath);
  var articlesJson = jsonEncode(articles);
  fileObj.writeAsStringSync(articlesJson);
}
