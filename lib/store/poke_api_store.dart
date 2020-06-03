import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:pokeflutter/consts/consts_app.dart';
import 'package:pokeflutter/models/poke_api_model.dart';

part 'poke_api_store.g.dart';

class PokeApiStore = _PokeApiStoreBase with _$PokeApiStore;

abstract class _PokeApiStoreBase with Store {
  @observable
  PokeApiModel _pokeApiModel;

  @computed
  PokeApiModel get pokeApiModel => _pokeApiModel;

  @action
  fetchPokemonList() {
    loadPokeApi().then((pokelist) {
      _pokeApiModel = pokelist;
    });
  }

  Future<PokeApiModel> loadPokeApi() async {
    try {
      final response = await http.get(ConstsApp.baseURL);
      var decodedJSON = jsonDecode(response.body);

      return PokeApiModel.fromJson(decodedJSON);
    } catch (error, stacktrace) {
      print("Erro ao carregar lista" + stacktrace.toString());
      return null;
    }
  }
}