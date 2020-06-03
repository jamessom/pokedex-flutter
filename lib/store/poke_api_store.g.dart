// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poke_api_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokeApiStore on _PokeApiStoreBase, Store {
  Computed<PokeApiModel> _$pokeApiModelComputed;

  @override
  PokeApiModel get pokeApiModel => (_$pokeApiModelComputed ??=
          Computed<PokeApiModel>(() => super.pokeApiModel,
              name: '_PokeApiStoreBase.pokeApiModel'))
      .value;

  final _$_pokeApiModelAtom = Atom(name: '_PokeApiStoreBase._pokeApiModel');

  @override
  PokeApiModel get _pokeApiModel {
    _$_pokeApiModelAtom.reportRead();
    return super._pokeApiModel;
  }

  @override
  set _pokeApiModel(PokeApiModel value) {
    _$_pokeApiModelAtom.reportWrite(value, super._pokeApiModel, () {
      super._pokeApiModel = value;
    });
  }

  final _$_PokeApiStoreBaseActionController =
      ActionController(name: '_PokeApiStoreBase');

  @override
  dynamic fetchPokemonList() {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction(
        name: '_PokeApiStoreBase.fetchPokemonList');
    try {
      return super.fetchPokemonList();
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pokeApiModel: ${pokeApiModel}
    ''';
  }
}
