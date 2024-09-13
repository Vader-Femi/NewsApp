import 'package:myapplication/core/res/data_state.dart';
import 'package:myapplication/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {

  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}