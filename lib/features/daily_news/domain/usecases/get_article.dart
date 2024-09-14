import 'package:myapplication/core/res/data_state.dart';
import 'package:myapplication/core/usecase/usecase.dart';
import 'package:myapplication/features/daily_news/domain/entities/article.dart';
import 'package:myapplication/features/daily_news/domain/repository/article_repository.dart';

class GetArticleUseCase extends /* or implements */ Usecase<DataState<List<ArticleEntity>>, dynamic>{

  final ArticleRepository _articleRepository;
  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }

}