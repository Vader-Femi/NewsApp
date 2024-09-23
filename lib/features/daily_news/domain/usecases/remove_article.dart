import 'package:myapplication/core/usecase/usecase.dart';
import 'package:myapplication/features/daily_news/data/models/article.dart';
import 'package:myapplication/features/daily_news/domain/entities/article.dart';
import 'package:myapplication/features/daily_news/domain/repository/article_repository.dart';

class RemoveArticleUseCase extends /* or implements */ Usecase<void, ArticleEntity>{

  final ArticleRepository _articleRepository;
  RemoveArticleUseCase(this._articleRepository);

  @override
  Future<void> call({ ArticleEntity ? params}) {
    return _articleRepository.removeArticle(params!);
  }

}