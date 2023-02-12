import 'package:a1_fakenews/displayNews/news_page.dart';
import 'package:a1_fakenews/routes/articles/article_page.dart';
import 'unknown_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'home/home_page.dart';

class RouteGenerator {

  static const String homePage = '/';
  static const String articlePage = '/articlePage';

  //private constructor
  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (_) => const NewsPage(),
        );
      case articlePage:
        return MaterialPageRoute(
          builder: (_) => const ArticlePage(), settings: settings,
        );
    }
    if(kDebugMode) {
      return MaterialPageRoute(builder: (context) =>  UnknownScreen());
    }
    else {
      return MaterialPageRoute(builder: (context) => HomePage());
    }
  }

}