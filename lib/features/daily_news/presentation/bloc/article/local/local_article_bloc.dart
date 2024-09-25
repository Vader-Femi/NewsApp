import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapplication/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:myapplication/features/daily_news/domain/usecases/remove_article.dart';
import 'package:myapplication/features/daily_news/domain/usecases/save_article.dart';
import 'package:myapplication/features/daily_news/presentation/bloc/article/local/local_article_event.dart';
import 'package:myapplication/features/daily_news/presentation/bloc/article/local/local_article_state.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvents, LocalArticleState> {
  final GetSavedArticleUseCase _getSavedArticleUseCase;
  final SaveArticleUseCase _saveArticleUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;

  LocalArticleBloc(this._getSavedArticleUseCase, this._saveArticleUseCase,
      this._removeArticleUseCase)
      : super(const LocalArticlesLoading()) {
    on <GetSavedArticle> (onGetSavedArticle);
    on <RemoveArticle> (onRemoveArticle);
    on <SaveArticle> (onSaveArticle);
  }

  void onGetSavedArticle(GetSavedArticle getSaveEvent, Emitter<LocalArticleState> emit) async {
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }

  void onRemoveArticle(
      RemoveArticle removeArticleEvent, Emitter<LocalArticleState> emit) async {
    await _removeArticleUseCase(params: removeArticleEvent.article);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }

  void onSaveArticle(
      SaveArticle saveArticleEvent, Emitter<LocalArticleState> emit) async {
    await _saveArticleUseCase(params: saveArticleEvent.article);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }
}
