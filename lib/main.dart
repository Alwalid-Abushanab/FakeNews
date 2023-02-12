import 'package:a1_fakenews/news_observer.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'news_app.dart';

void main() {
  BlocOverrides.runZoned(
        () => runApp( NewsApp()),
    blocObserver: NewsObserver(),
  );
}

