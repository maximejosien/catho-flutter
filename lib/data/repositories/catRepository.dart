import 'package:catho_app/data/models/cat.dart';
import 'package:catho_app/data/providers/catsProvider.dart';
import 'package:dio/dio.dart';

class CatsRepository {

  CatsRepository._privateConstructor();
  static final CatsRepository _instance = CatsRepository._privateConstructor();
  static CatsRepository get instance => _instance;

  List<Cat> _cats = [];

  Future<List<Cat>> firstCat() async {
    Response response = await CatsProvider().getCats();

    if (response.data is List) {
      List data = response.data;
      _cats =  data.map((object) => Cat.fromJson(object)).toList();
      return _cats;
    } else if (response.statusCode == 404) {
      return null;
    }
  }
}
