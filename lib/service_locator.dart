import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:myapplication/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:myapplication/features/daily_news/data/sources/remote/news_api_service.dart';
import 'package:myapplication/features/daily_news/domain/repository/article_repository.dart';
import 'package:myapplication/features/daily_news/domain/usecases/get_article.dart';
import 'package:myapplication/features/daily_news/presentation/bloc/atricle/remote/remote_article_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  //Dio
  sl.registerSingleton<Dio>(
      Dio()
  );

  //Dependencies
  sl.registerSingleton<NewsApiService>(
      NewsApiService(sl())
  );

  sl.registerSingleton<ArticleRepository>(
      ArticleRepositoryImpl(sl())
  );

  sl.registerSingleton<GetArticleUseCase>(
      GetArticleUseCase(sl())
  );

  //Blocs
  sl.registerFactory<RemoteArticleBloc>(
      () => RemoteArticleBloc(sl())
  );

}