import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:media_stack/model/news_model.dart';

import 'browse_widget.dart';

class articleWidget extends StatefulWidget {
  const articleWidget({Key? key, required this.newsArticle}) : super(key: key);
  final NewsArticle? newsArticle;
  @override
  _articleWidgetState createState() => _articleWidgetState();
}

class _articleWidgetState extends State<articleWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 150,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector( onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) {
          return BrowserWidget(newsArticle: widget.newsArticle);
        },));},
          child: Card(
            margin: const EdgeInsets.all(10),
            elevation: 10,
            shadowColor: Colors.cyan,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(widget.newsArticle!.title!,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis),
                ), 
                CachedNetworkImage(
        imageUrl: widget.newsArticle!.image!,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
     ),         
              ],
            ),
          ),
        ),
      ),
    );
  }
}