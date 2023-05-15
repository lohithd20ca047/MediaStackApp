import 'package:flutter/material.dart';
import 'package:media_stack/model/news_model.dart';
import 'package:media_stack/service/bookmarks/bookmark_file_handling.dart';
import 'package:media_stack/service/news_service.dart';
import 'package:media_stack/view/search_view.dart';
import 'news_utility.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'NewsToday',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        )),
      ),
      body: getBody(),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) => setState(() {
                currentIndex = index;
              }),
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'HOME',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined),
              label: 'LIKE',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'SEARCH',
            )
          ]),
    );
  }

  Widget getHomePage() {
    return FutureBuilder(
      future: listOfNews(),
      builder:
          (BuildContext context, AsyncSnapshot<List<NewsArticle>> snapshot) {
        if (snapshot.hasData == true) {
          return ListView(
            children: newsDesigns(snapshot.data!),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget getBody() {
    switch (currentIndex) {
      case 0:
        return getHomePage();
      case 1:
        return getBookMark();
      case 2:
        return getSearch();
    }
    return getBody();
  }

  Widget getBookMark() {
    return FutureBuilder(
      future: readBookmarks(),
      builder:
          (BuildContext context, AsyncSnapshot<List<NewsArticle>> snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView(
          children: newsDesigns(snapshot.data!),
        );
      },
    );
  }

  Widget getSearch() {
    return const SearchView();
  }
}
