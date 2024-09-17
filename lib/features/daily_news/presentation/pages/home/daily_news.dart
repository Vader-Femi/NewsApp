import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapplication/features/daily_news/presentation/bloc/atricle/remote/remote_article_bloc.dart';
import 'package:myapplication/features/daily_news/presentation/bloc/atricle/remote/remote_article_event.dart';
import 'package:myapplication/features/daily_news/presentation/bloc/atricle/remote/remote_article_state.dart';
import 'package:myapplication/service_locator.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  _buildAppbar() {
    return AppBar(
      title: const Text("Daily News"),
    );
  }

  _buildBody() {
    return BlocProvider<RemoteArticleBloc>(
      create: (_) => RemoteArticleBloc(sl())..add(GetArticles()),//sl()..add(const GetArticles()),
      child: BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
          builder: (_, state) {
        if (state is RemoteArticlesLoading) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }
      
        if (state is RemoteArticlesError) {
          return const Center(
            child: Icon(Icons.refresh_outlined),
          );
        }
      
        if (state is RemoteArticlesDone) {
          return ListView.builder(
            itemBuilder: (context, index){
                return ListTile(
                  title: Text("$index"),
                );
            },
            itemCount: state.articles!.length,
      
          );
        }
      
        return const SizedBox();
      }),
    );
  }
}