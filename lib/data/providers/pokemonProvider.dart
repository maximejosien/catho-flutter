import 'dart:io';

import 'package:catho_app/data/models/pokemon.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class PokemonProvider {

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<Pokemon> getPokemon(String pokemonName) async {
    var dio = Dio();

    Response dittoResponse = await dio.get("https://pokeapi.co/api/v2/pokemon/" + pokemonName +  "/");
    Pokemon pokemon = Pokemon.fromJsonMap(dittoResponse.data);

//    dio.post("https://url...", data: pokemon.toJson(), options: BaseOptions(contentType: ContentType.parse));

    final SharedPreferences prefs = await _prefs;
    prefs.setString('pokemon', pokemon.name);


    _storage.write(key: "pokemon", value: pokemonName);
    dio.options.headers["Authorization"] = "Bearer ${_storage.read(key: "token")}";

    return pokemon;
  }

  Future<Pokemon> getAllPokemon() async {
    var dio = Dio();
    Response allPokemonData = await dio.get("https://pokeapi.co/api/v2/pokemon?limit=151");
    print(allPokemonData);
    List<Pokemon> allPokemon;
    return Pokemon.fromJsonMap(allPokemonData.data);
  }
}