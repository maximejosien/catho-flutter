import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CatsProvider {

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<Response> getCats() async {
    var dio = Dio();
    dio.options.headers["x-api-key"] = "a9ce6fe8-f7fe-4d57-8de8-3dd71113cf43";
    
    Response catsResponse = await dio.get("https://api.thecatapi.com/v1/images/search?limit=10");

    debugPrint(catsResponse.data.toString());
    return catsResponse;
  }
}