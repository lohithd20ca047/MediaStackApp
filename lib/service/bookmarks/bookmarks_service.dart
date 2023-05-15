import 'package:media_stack/model/news_model.dart';
import 'package:media_stack/service/bookmarks/bookmark_file_handling.dart';

Future addBookmark(NewsArticle article) async {
  var bookmarkedArticles = await readBookmarks();
  bookmarkedArticles.add(article);
  await writeBookmarks(bookmarkedArticles);
}

Future removeBookmark(NewsArticle article) async {
  var bookmarkedArticles = await readBookmarks();
  bookmarkedArticles.removeWhere((element) => element.title == article.title);
  await writeBookmarks(bookmarkedArticles);
}

Future<bool> isBookmarked(NewsArticle article) async {
  var bookmarkedArticles = await readBookmarks();

  

  return bookmarkedArticles.any((element) => element.title == article.title);
}
