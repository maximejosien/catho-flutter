import 'package:catho_app/data/models/pokemon.dart';
import 'package:catho_app/data/repositories/pokemonRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailsPage extends StatelessWidget {
  static const String routeName = "/details";

  List _list = [1,2,3,4,5,6];

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    String text = "J'ai pas de titre";
    if (arguments != null) text = arguments['text'];

    return Scaffold(
      appBar: AppBar(
        title: Text(text),
      ),
      body: FutureBuilder(
        future: PokemonRepository().getPokemon("pikachu"),
        builder: (BuildContext context, AsyncSnapshot<Pokemon> data) {
          if (data.hasData) {
            Pokemon pokemon = data.data;
            return Text(pokemon.name);
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }

}