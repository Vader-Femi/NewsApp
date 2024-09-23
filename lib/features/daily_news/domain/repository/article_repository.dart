import 'package:myapplication/core/res/data_state.dart';
import 'package:myapplication/features/daily_news/data/models/article.dart';
import 'package:myapplication/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {

  //API Methods
  Future<DataState<List<ArticleEntity>>> getNewsArticles();


  //Database Methods
  Future<List<ArticleModel>> getSavedArticles();

  Future<void> saveArticle(ArticleEntity article);

  Future<void> removeArticle(ArticleEntity article);
}