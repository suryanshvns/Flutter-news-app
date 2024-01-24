import 'package:news_app/models/category_news_model.dart';
import 'package:news_app/models/news_channel_headlines_model.dart';
import 'package:news_app/repository/news_repository.dart';

class NewsViewModel {
  final _rep = NewsRepository();

  Future<NewsChannelHeadlinesModel> fetchNewsChannelHeadlinesApi(String selectedSource) async {
    final response = await _rep.fetchNewsChannelHeadlinesApi(selectedSource); // Pass the selectedSource parameter here
    return response;
  }
  Future<CategoriesNewsModel> fetchCategoriesNewsApi(String categories) async {
    final response = await _rep.fetchCategoriesNewsApi(categories); // Pass the selectedSource parameter here
    return response;
  }
}