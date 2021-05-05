import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pokeflutter/consts/consts_app.dart';
import 'package:pokeflutter/models/pokeapi.dart';
import 'package:pokeflutter/pages/home_page/widgets/app_bar_home.dart';
import 'package:pokeflutter/pages/home_page/widgets/poke_item.dart';
import 'package:pokeflutter/stores/poke_api_store.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PokeApiStore pokeApiStore;

  @override
  void initState() {
    super.initState();

    pokeApiStore = PokeApiStore();
    pokeApiStore.fetchPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double statusWidth = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: Colors.red,
      body: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
              top: -(240 / 4.7),
              left: screenWidth - (240 / 1.6),
              child: Opacity(
                child: Image.asset(
                  ConstsApp.whitePokeball,
                  height: 240,
                  width: 240,
                ),
                opacity: 0.1,
              )),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: statusWidth,
                ),
                AppBarHome(),
                Expanded(
                  child: Container(
                    child: Observer(
                      name: 'ListaHomePage',
                      builder: (BuildContext context) {
                        PokeAPI _pokeApi = pokeApiStore.pokeAPI!;

                        // ignore: unnecessary_null_comparison
                        return (_pokeApi != null)
                            ? AnimationLimiter(
                                child: GridView.builder(
                                  physics: BouncingScrollPhysics(),
                                  padding: EdgeInsets.all(12),
                                  addAutomaticKeepAlives: true,
                                  gridDelegate:
                                      new SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2),
                                  itemCount: _pokeApi.pokemon?.length,
                                  itemBuilder: (context, index) {
                                    Pokemon pokemon =
                                        pokeApiStore.getPokemon(index: index);

                                    return AnimationConfiguration.staggeredGrid(
                                      position: index,
                                      duration:
                                          const Duration(milliseconds: 375),
                                      columnCount: 2,
                                      child: ScaleAnimation(
                                        child: GestureDetector(
                                          child: PokeItem(
                                              index: index,
                                              name: pokemon.name!,
                                              image: pokeApiStore.getImage(
                                                  numero: pokemon.num!)),
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        Container(),
                                                    fullscreenDialog: true));
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            : Center(
                                child: CircularProgressIndicator(),
                              );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
