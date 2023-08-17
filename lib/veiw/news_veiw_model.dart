import 'package:news_app/models/news_channel_headline.dart';

import '../repository/news_repo.dart';

class NewsViewModel {
  final _repo = NewsRepository();
  Future<NewsChannelsHeadlinesModel> fetchNewsChannelApi() async {
    final response = await _repo.fetchNewsChannelApi();
    return response;
  }
}
