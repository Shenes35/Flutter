
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_api/core/core.dart';
import 'package:news_api/model/newsapi/newsapi.dart'; 

Future<void> getNewsArticles() async {
  const url = 'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=d04ea2307c49415e9ed564f7f4905640';
  
  final response = await http.get(Uri.parse(url));
  
    final jsonBody = jsonDecode(response.body) as Map<String, dynamic>;
    final newsData = Newsapi.fromJson(jsonBody);
    newListNotifier.value= newsData.articles!;
    newListNotifier.notifyListeners();
  
}
