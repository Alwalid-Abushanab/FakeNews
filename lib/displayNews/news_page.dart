import 'package:a1_fakenews/cubit/news_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../routes/home/home_page.dart';
import '../news/model/fetcher/fake_news_gen.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsCubit>(
          create: (context) => NewsCubit(FakeNewsGenerator()),
        )
      ],
      child: HomePage(),
    );

  }
}