import 'package:dio/dio.dart';
import 'package:newsapp/constant/constant.dart';
import 'package:newsapp/model/model.dart';

class WebService {
  var dio = Dio();

  // for headlines
  Future<List<ModelNewsArticle>> getTopHeadlines() async {
    final response = await dio.get(Constants.topheadlines);

    if (response.statusCode == 200) {
      // 200 represent successful response

      final result = response.data;

      Iterable list = result['articles'];
      return list.map((article) => ModelNewsArticle.fromJson(article)).toList();
    } else {
      throw Exception('response failed');
    }
  }
}
