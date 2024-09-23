import 'package:myapplication/core/usecase/usecase.dart';
import 'package:myapplication/features/daily_news/domain/entities/article.dart';
import 'package:myapplication/features/daily_news/domain/repository/article_repository.dart';

class GetSavedArticleUseCase extends /* or implements */ Usecase<List<ArticleEntity>, dynamic>{

  final ArticleRepository _articleRepository;
  GetSavedArticleUseCase(this._articleRepository);

  @override
  Future<List<ArticleEntity>> call({void params}) {
    return _articleRepository.getSavedArticles();
  }

}