import 'package:flutter/material.dart';
import 'package:news_api/api/api.dart'; // <-- your API call
import 'package:news_api/core/core.dart';

import 'package:url_launcher/url_launcher.dart';


class ScreenApiHome extends StatefulWidget {
  const ScreenApiHome({super.key});

  @override
  State<ScreenApiHome> createState() => _ScreenApiHomeState();
}

class _ScreenApiHomeState extends State<ScreenApiHome> {
  
  @override
  Widget build(BuildContext context) {
    getNewsArticles();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('News Asia'),
          backgroundColor: Colors.amberAccent,
        ),
        body: ValueListenableBuilder
        (valueListenable: newListNotifier,
          builder: (context,newList,_) {
            return ListView.separated(
              itemCount: newList.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final article = newList[index];
                return ListTile(
                  leading: article.urlToImage != null
              ? CircleAvatar(
                  backgroundImage: NetworkImage(article.urlToImage!),
                  radius: 30,
                )
              : const CircleAvatar(
                  child: Icon(Icons.image_not_supported),
                  radius: 30,
                ),
                  title: Text('${article.title}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12)),
                  subtitle: Text('${article.publishedAt} | ${article.content}| ${article.description}'),
                  onTap: () async{
                    final Uri url = Uri.parse(article.url!);
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  },
                );
              },
            );
          }
        )


      ),
    );
  }
}
