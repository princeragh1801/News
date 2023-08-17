import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:news_app/secrets.dart';
import 'package:http/http.dart' as http;

import '../models/category_news_model.dart';
import '../models/news_channel_headline.dart';

class NewsRepository {
  Future<NewsChannelsHeadlinesModel> fetchNewsChannelApi() async {
    String url = topHeadlineBBC;
    final response = await http.get(Uri.parse(url));
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return NewsChannelsHeadlinesModel.fromJson(body);
    }
    throw ('Error occured');
  }

  Future<CategoryNewsModel> fetchNewsCategoryApi(String selectedCategory) async {
    // String selectedCategory = 'general';
    String url =
        'https://newsapi.org/v2/top-headlines?country=in&category=$selectedCategory&apiKey=0802cb8a4229403fa4e0518048abff5d';
    final response = await http.get(Uri.parse(url));
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return CategoryNewsModel.fromJson(body);
    }
    throw ('Error occured');
  }
}
