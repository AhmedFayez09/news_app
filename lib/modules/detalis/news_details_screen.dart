import 'package:flutter/material.dart';
import 'package:news_c6/models/NewsModel.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsScreen extends StatelessWidget {
  static const String routeName = 'news Deatils';

  @override
  Widget build(BuildContext context) {
    Articles articles = ModalRoute.of(context)!.settings.arguments as Articles;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage(''),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(35),
              ),
            ),
            title: const Text("News Details"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  child: Image.network(articles.urlToImage ?? ''),
                  borderRadius: BorderRadius.circular(15),
                ),
                const SizedBox(height: 8),
                Text(
                  articles.source!.name ?? '',
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color.fromRGBO(121, 130, 139, 1),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  articles.title ?? '',
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(121, 130, 139, 1),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  child: Text(
                    articles.publishedAt ?? '',
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(121, 130, 139, 1),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  child: Column(
                    children: [
                      Text(
                        articles.description ?? '',
                        style: TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 35),
                      InkWell(
                        onTap: () {
                          _launchInBrowser(
                            Uri.parse(articles.url ?? ''),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text(
                              'View Full Article..',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(
                              Icons.play_arrow_sharp,
                              size: 20,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }
}
