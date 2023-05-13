import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../model/news_model.dart';

String fileName = 'FavouriteMeme.json'

Future<String> getPath()async {
  var div = await getExternalStorageDirectory();
  var filePath ='${div!.path}/$fileName';
  return filePath;
}

Future<List<NewsArticle>> readAllBookMarks() async {
  
  var filePath = await getPath();
  var fileObj = File(filePath);
  if (fileObj.existsSync()) {
    var contents = fileObj.readAsStringSync();
    var bookmarkJson = jsonDecode(contents);
  
  }
  
}
getAddLike(){}
getDeleteLike(){}
