import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/category_news_model.dart';
import 'package:news_app/models/news_channel_headlines_model.dart';

class NewsRepository {
  final http.Client httpClient = http.Client();

  Future<NewsChannelHeadlinesModel> fetchNewsChannelHeadlinesApi(String newsChannel) async {
    String url =
        'https://newsapi.org/v2/top-headlines?sources=${newsChannel}&apiKey=c278866fe6da40d09041b6b91637f5da';

    final response = await httpClient.get(Uri.parse(url));
    if (kDebugMode) {
      print(response.body);
    }

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return NewsChannelHeadlinesModel.fromJson(body);
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  }


 Future<CategoriesNewsModel> fetchCategoriesNewsApi(String categories) async {
    String url =
        'https://newsapi.org/v2/everything?q=${categories}&apiKey=c278866fe6da40d09041b6b91637f5da';

    final response = await httpClient.get(Uri.parse(url));
    if (kDebugMode) {
      print(response.body);
    }

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return CategoriesNewsModel.fromJson(body);
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  }
}

