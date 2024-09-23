import 'package:myapplication/core/usecase/usecase.dart';
import 'package:myapplication/features/daily_news/data/models/article.dart';
import 'package:myapplication/features/daily_news/domain/entities/article.dart';
import 'package:myapplication/features/daily_news/domain/repository/article_repository.dart';

class SaveArticleUseCase extends /* or implements */ Usecase<void, ArticleEntity>{

  final ArticleRepository _articleRepository;
  SaveArticleUseCase(this._articleRepository);

  @override
  Future<void> call({ ArticleEntity ? params}) {
    return _articleRepository.saveArticle(params!);
  }

}