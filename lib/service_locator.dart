import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:myapplication/features/daily_news/data/sources/local/app_database.dart';
import 'features/daily_news/data/repository/article_repository_impl.dart';
import 'features/daily_news/data/sources/remote/news_api_service.dart';
import 'features/daily_news/domain/repository/article_repository.dart';
import 'features/daily_news/domain/usecases/get_article.dart';
import 'features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  //Database
  final database = await $FloorAppDatabase.databaseBuilder("app_database.db").build();
  sl.registerSingleton<AppDatabase>(database);

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