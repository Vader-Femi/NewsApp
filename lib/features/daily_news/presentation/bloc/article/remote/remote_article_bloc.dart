import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapplication/core/res/data_state.dart';
import 'package:myapplication/features/daily_news/domain/usecases/get_article.dart';
import '../../../bloc/article/remote/remote_article_event.dart';
import '../../../bloc/article/remote/remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticlesEvent, RemoteArticleState> {

  final GetArticleUseCase _getArticleUseCase;

  RemoteArticleBloc(this._getArticleUseCase) : super(const RemoteArticlesLoading()){
   on <GetArticles> (onGetArticles);
  }

  void onGetArticles(GetArticles event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _getArticleUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty){
      emit(RemoteArticlesDone(dataState.data!));
    }

    if (dataState is DataFailed){
      emit(RemoteArticlesError(dataState.error!));
    }
  }

}