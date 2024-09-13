import 'package:dio/dio.dart';
import 'package:myapplication/core/constants/app_urls.dart';
import 'package:myapplication/features/daily_news/data/models/article.dart';
import 'package:retrofit/retrofit.dart';

part "news_api_service.g.dart";

@RestApi(baseUrl: AppURLS.newsAPIBaseURL)
abstract class NewsApiService {
  factory NewsApiService(DioException dioException) = _NewsApiService;

  @GET("/top-headlines")
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    @Query("apikey") String ? apiKey,
    @Query("country") String ? country,
    @Query("category") String ? category,
  })

}