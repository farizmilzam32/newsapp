import 'package:flutter/cupertino.dart';
import 'package:newsapp/model/model.dart';
import 'package:newsapp/service/service.dart';
import 'package:newsapp/viewmodel/viewmodel.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class ListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.empty;

  
  // ignore: deprecated_member_use
  List<ViewModel> articles = <ViewModel>[];

  // methods to fetch news
  void fetchTopNewsHeadlines() async {
    List<ModelNewsArticle> _newsarticles = await WebService().getTopHeadlines();
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    articles =
        _newsarticles.map((article) => ViewModel(article: article)).toList();

    if (articles.isEmpty) {
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }
}
