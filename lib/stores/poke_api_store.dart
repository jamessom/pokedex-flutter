import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:pokeflutter/consts/consts_api.dart';
import 'package:pokeflutter/models/pokeapi.dart';

part 'poke_api_store.g.dart';

class PokeApiStore = _PokeApiStoreBase with _$PokeApiStore;

abstract class _PokeApiStoreBase with Store {
  @observable
  PokeAPI pokeAPI;

  @action
  fetchPokemonList() {
    loadPokeAPI().then((pokelist) {
      pokeAPI = pokelist;
    });
  }

  Future<PokeAPI> loadPokeAPI() async {
    try {
      final response = await http.get(Uri.parse(ConstsAPI.pokeapiURL));
      var decodedJSON = jsonDecode(response.body);

      return PokeAPI.fromJson(decodedJSON);
    } catch (error, stacktrace) {
      print("Erro ao carregar lista" + stacktrace.toString());
      return null;
    }
  }
}
