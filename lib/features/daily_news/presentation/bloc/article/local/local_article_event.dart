import 'package:equatable/equatable.dart';
import 'package:myapplication/features/daily_news/domain/entities/article.dart';

abstract class LocalArticleEvents extends Equatable {
  final ArticleEntity ? article;

  const LocalArticleEvents({this.article});

  @override
  List<Object?> get props => [article!];
}

class GetSavedArticle extends LocalArticleEvents {
  const GetSavedArticle();
}

class RemoveArticle extends LocalArticleEvents {
  const RemoveArticle(ArticleEntity article) : super(article: article);
}

class SaveArticle extends LocalArticleEvents {
  const SaveArticle(ArticleEntity article) : super(article: article);
}

