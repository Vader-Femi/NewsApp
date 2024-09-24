import 'package:equatable/equatable.dart';
import 'package:myapplication/features/daily_news/domain/entities/article.dart';

abstract class LocalArticleEvents extends Equatable {
  final ArticleEntity ? articleEntity;

  const LocalArticleEvents({this.articleEntity});

}