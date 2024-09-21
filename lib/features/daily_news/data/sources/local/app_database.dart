import 'package:floor/floor.dart';
import 'package:myapplication/features/daily_news/data/models/article.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
part 'app_database.g.dart';

@Database(version: 1, entities: [ArticleModel])
abstract class AppDatabase extends FloorDatabase {

  ArticleModel get articleDAO;
}