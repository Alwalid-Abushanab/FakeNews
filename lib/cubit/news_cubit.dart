import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../news/model/fetcher/news_gen.dart';
import '../news/model/news_item.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {

  final NewsSourcer _newsFetcher;

  NewsCubit(this._newsFetcher) : super(const NewsInitial());

  Future<void> getNews() async {
    bool tryAgain = true;

    //try 3 times to fetch the news
    for (var i = 0; i < 3; i++) {
      try {
        emit(const NewsLoading());

        final news = await _newsFetcher.getNews();

        emit(NewsLoaded(news));
        tryAgain = false;
      } on FormatException {
        tryAgain = true;
      } on RangeError {
        tryAgain = true;
      } on NetworkException {
        emit(const NewsError("Internet Error"));
        tryAgain = true;
      }

      if (!tryAgain) {
        break;
      }
    }
  }

  /// update the news article to be marked as viewed
  void update(List<NewsItem> news) {
    if(state is NewsLoaded) {
      emit(NewsViewed(news));
    }
    else{
      emit(NewsLoaded(news));
    }
  }
}