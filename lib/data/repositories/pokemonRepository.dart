import 'package:catho_app/data/models/pokemon.dart';
import 'package:catho_app/data/providers/pokemonProvider.dart';

class PokemonRepository {

  Future<Pokemon> getPokemon(String pokemon) => PokemonProvider().getPokemon(pokemon);

  Future<Pokemon> getAllPokemon() => PokemonProvider().getAllPokemon();
}