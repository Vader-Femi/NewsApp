import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../service_locator.dart';
import '../../../presentation/bloc/article/remote/remote_article_bloc.dart';
import '../../../presentation/bloc/article/remote/remote_article_event.dart';
import '../../../presentation/bloc/article/remote/remote_article_state.dart';
import '../../../domain/entities/article.dart';
import '../../widgets/article_tile.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(),
    );
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
      title: const Text("Daily News"),
      automaticallyImplyLeading: false,
      actions: [
        GestureDetector(
          onTap: () => _onShowSavedArticlesViewTapped(context),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Icon(Icons.bookmark),
          ),
        ),
      ],
    );
  }

  _buildBody() {
    return BlocProvider<RemoteArticleBloc>(
      create: (_) => RemoteArticleBloc(sl())
        ..add(const GetArticles()), //sl()..add(const GetArticles()),
      child: BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
          builder: (_, state) {
        if (state is RemoteArticlesLoading) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }

        if (state is RemoteArticlesError) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("${state.error?.message}"),
                  const SizedBox(height: 10),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                    )),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Refresh"),
                        Icon(Icons.refresh_outlined),
                      ],
                    ),
                    onPressed: () =>
                        RemoteArticleBloc(sl())..add(const GetArticles()),
                  ),
                ],
              ),
            ),
          );
        }

        if (state is RemoteArticlesDone) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return ArticleWidget(
                article: state.articles?[index] ,
                onArticlePressed: (article) => _onArticlePressed(context,article),
              );
            },
            itemCount: state.articles?.length ?? 0,
          );
        }

        return const SizedBox();
      }),
    );
  }

  void _onArticlePressed(BuildContext context, ArticleEntity article) {
    Navigator.pushNamed(context, '/ArticleDetails', arguments: article);
  }

  void _onShowSavedArticlesViewTapped(BuildContext context) {
    Navigator.pushNamed(context, '/SavedArticles');
  }
}
