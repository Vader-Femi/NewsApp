import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:myapplication/core/constants/constants.dart';
import 'package:myapplication/core/res/data_state.dart';
import 'package:myapplication/features/daily_news/data/models/article.dart';
import 'package:myapplication/features/daily_news/data/sources/local/app_database.dart';
import 'package:myapplication/features/daily_news/data/sources/remote/news_api_service.dart';
import 'package:myapplication/features/daily_news/domain/entities/article.dart';
import 'package:myapplication/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository{

  final NewsApiService _newsApiService;
  final AppDatabase _appDatabase;
  ArticleRepositoryImpl(this._newsApiService, this._appDatabase);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {

    try {
      final httpResponse = await _newsApiService.getNewsArticles(
          apiKey: Constants.newsAPIKey,
          country: Constants.countryQuery,
          category: Constants.categoryQuery
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        if (kDebugMode) {
          print(httpResponse.response);
        }
        return DataFailed(
            DioException(
              requestOptions: httpResponse.response.requestOptions,
              response: httpResponse.response,
              error: "${httpResponse.response.statusCode}: ${httpResponse.response.statusMessage}",
              message: httpResponse.response.statusMessage,
            )
        );
      }
    } on DioException catch (e){
      if (kDebugMode) {
        print(e);
      }
      return DataFailed(e);
    }
  }

  @override
  Future<List<ArticleModel>> getSavedArticles() async {
    return _appDatabase.articleDAO.getArticle();
  }

  @override
  Future<void> removeArticle(ArticleEntity article) {
    return _appDatabase.articleDAO.deleteArticle(ArticleModel.fromEntity(article));
  }

  @override
  Future<void> saveArticle(ArticleEntity article) {
    return _appDatabase.articleDAO.insertArticle(ArticleModel.fromEntity(article));
  }

}