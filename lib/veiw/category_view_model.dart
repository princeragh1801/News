import 'package:news_app/models/category_news_model.dart';
import 'package:news_app/repository/news_repo.dart';

class CategoryViewModel {
  final _repo = NewsRepository();
  Future<CategoryNewsModel> fetchNewsCategoryApi(String selectedCategory) async {
    final response = await _repo.fetchNewsCategoryApi(selectedCategory);
    return response;
  }
}
