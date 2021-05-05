import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:pokeflutter/consts/consts_api.dart';
import 'package:pokeflutter/models/pokeapi.dart';

part 'poke_api_store.g.dart';

class PokeApiStore = _PokeApiStoreBase with _$PokeApiStore;

abstract class _PokeApiStoreBase with Store {
  @observable
  PokeAPI? _pokeAPI;

  @computed
  PokeAPI? get pokeAPI => _pokeAPI;

  @action
  fetchPokemonList() {
    loadPokeAPI().then((pokelist) {
      _pokeAPI = pokelist!;
    });
  }

  @action
  getPokemon({required int index}) {
    return _pokeAPI!.pokemon[index];
  }

  @action
  Widget getImage({required String numero}) {
    return CachedNetworkImage(
      placeholder: (context, url) => new Container(
        color: Colors.transparent,
      ),
      imageUrl: 'http://www.serebii.net/pokemongo/pokemon/$numero.png',
    );
  }

  Future<PokeAPI?> loadPokeAPI() async {
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
