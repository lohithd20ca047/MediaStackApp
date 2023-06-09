import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:media_stack/model/news_model.dart';
import 'package:share_plus/share_plus.dart';
import 'browse_widget.dart';
import '../service/bookmarks/bookmarks_service.dart';

class ArticleWidget extends StatefulWidget {
  const ArticleWidget({Key? key, required this.newsArticle}) : super(key: key);
  final NewsArticle? newsArticle;
  @override
  _ArticleWidgetState createState() => _ArticleWidgetState();
}

class _ArticleWidgetState extends State<ArticleWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      
      width: 150,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return BrowserWidget(newsArticle: widget.newsArticle);
              },
            ));
          },
          child: Card(
            margin: const EdgeInsets.all(10),
            elevation: 10,
            shadowColor: Colors.cyan,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(widget.newsArticle!.title!, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold), maxLines: 3, overflow: TextOverflow.ellipsis),
                ),
                widget.newsArticle!.image != null
                    ? CachedNetworkImage(
                        imageUrl: widget.newsArticle!.image!,
                        width: double.infinity,
                        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => const Icon(Icons.image_not_supported_outlined, size: 190),
                      )
                    : const Icon(
                        Icons.image_not_supported_outlined,
                        size: 190,
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.share),
                      onPressed: () {
                        Share.share(widget.newsArticle!.url!, subject: 'Look what I made!');
                      },
                    ),
                    FutureBuilder(
                      future: isBookmarked(widget.newsArticle!),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) return const CircularProgressIndicator();
                        var isArticleBookmarked = snapshot.data!;

                        return IconButton(
                            onPressed: () async {
                              if (isArticleBookmarked) {
                                await removeBookmark(widget.newsArticle!);
                              } else {
                                await addBookmark(widget.newsArticle!);
                              }
                              setState(() {});
                            },
                            icon: Icon(isArticleBookmarked ? Icons.favorite : Icons.favorite_outline));
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
