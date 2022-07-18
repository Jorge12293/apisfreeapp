import 'package:apisfreeapp/src/data/http/services/pokemon_services.dart';
import 'package:apisfreeapp/src/domain/responses/responses_pokemon/response_pokemon_detalle.dart';
import 'package:apisfreeapp/src/domain/responses/responses_pokemon/response_pokemon_list.dart';
import 'package:apisfreeapp/src/ui/pages/pokemon_page/pokemon_detalle_page.dart';
import 'package:flutter/material.dart';

class PokemonPageWidget {

  PokemonServices pokemonService = PokemonServices();

  Widget cardPokemon(PokemonName pokemonName, index) {
    return Card(
        margin: const EdgeInsets.only(left: 15, right: 15,top: 5,bottom: 5),
        elevation: 10,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: SizedBox(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Text(pokemonName.name.toUpperCase(),
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        ),
                        const SizedBox(width: 5),
                        const Image(
                            height: 15,
                            width: 15,
                            image: AssetImage('assets/img/pokeball.png')),
                      ],
                    ),
                  )),
               loadImagePokemon(pokemonName)
            ],
          ),
        ));
  }

  Widget loadImagePokemon(PokemonName pokemonName) {
    return Center(
        child: FutureBuilder<ResponsePokemonDetalle?>(
            future: pokemonService.detallePokemonServices(pokemonName.name),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                ResponsePokemonDetalle respPokemonDetalle =
                    snapshot.data as ResponsePokemonDetalle;
                return Center(
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PokemonDetallePage(
                                  urlPokemon: pokemonName.url,
                                  namePokemon: pokemonName.name)),
                        );
                      },
                      child: FadeInImage(
                        placeholder:
                            const AssetImage('assets/img/pokeball.png'),
                        image: NetworkImage(
                            respPokemonDetalle.sprites.frontDefault),
                        fit: BoxFit.fill,
                        width: 110,
                        height: 110,
                      )),
                );
              } else if (snapshot.hasError) {
                return const Text('Error en peticion');
              } else {
                return const Center(
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
              }
            }));
  }

  Widget listPokemon(ResponsePokemonList respPokemonListAux) {
    List<PokemonName> pokemonNameListAux = respPokemonListAux.pokemonNameList;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        crossAxisCount: 2,
      ),
      itemBuilder: (_, index) => cardPokemon(pokemonNameListAux[index], index),
      itemCount: pokemonNameListAux.length,
    );
  }




}
