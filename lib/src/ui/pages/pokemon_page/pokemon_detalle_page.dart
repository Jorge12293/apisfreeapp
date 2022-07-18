import 'package:apisfreeapp/src/data/http/services/pokemon_services.dart';
import 'package:apisfreeapp/src/domain/responses/responses_pokemon/response_pokemon.dart';
import 'package:apisfreeapp/src/domain/responses/responses_pokemon/response_pokemon_evolution.dart';
import 'package:apisfreeapp/src/domain/responses/responses_pokemon/response_pokemon_species.dart';

import 'package:flutter/material.dart';

bool isLoading = true;

class PokemonDetallePage extends StatefulWidget {
  final String urlPokemon;
  final String namePokemon;
  PokemonDetallePage({required this.urlPokemon, required this.namePokemon});

  @override
  State<PokemonDetallePage> createState() => _PokemonDetallePageState();
}

class _PokemonDetallePageState extends State<PokemonDetallePage> {
  var colorPokemon = Colors.white54;
  String colorPokemonText = '';
  String textDescription = '';

  String? primerPokemon;
  String? segundoPokemon;
  String? tercerPokemon;

  ResponsePokemon? respPokemon;

  ResponsePokemon? respPokemonPrimero;
  ResponsePokemon? respPokemonSegundo;
  ResponsePokemon? respPokemonTercero;

  ResponsePokemonSpecies? respPokemonSpecies;
  ResponsePokemonEvolution? respPokemonEvol;

  bool loadData = false;
  bool loadDataCards = false;

  PokemonServices pokemonService = PokemonServices();

  @override
  void initState() {
    loadDataPokemon();
    super.initState();
  }

  void loadDataPokemon() async {
    loadData = true;
    setState(() {});
    respPokemon =
        await pokemonService.pokemonDataNameServices(widget.namePokemon);
    if (respPokemon != null) {
      respPokemonSpecies =
          await pokemonService.pokemonDataSpecieServices(respPokemon!.id);

      if (respPokemonSpecies != null) {
        respPokemonEvol = await pokemonService
            .pokemonEvolutionServices(respPokemonSpecies!.evolutionChain.url);
        loadConatinerCardsPokemons();
        changueColor(respPokemonSpecies!.color.name);
        selectDescription(respPokemonSpecies!.flavorTextEntries);
      }
    }
    loadData = false;
    setState(() {});

    if (respPokemonSpecies != null && respPokemonEvol != null) {
      loadConatinerCardsPokemons();
    }
  }

  void loadConatinerCardsPokemons() async {
    loadDataCards = true;
    setState(() {});
    if (respPokemonEvol!.chain.species.name.isNotEmpty) {
      primerPokemon = respPokemonEvol!.chain.species.name;
      respPokemonPrimero =
          await pokemonService.pokemonDataNameServices(primerPokemon!);
      if (respPokemonEvol!.chain.evolvesTo.isNotEmpty) {
        segundoPokemon = respPokemonEvol!.chain.evolvesTo[0].species.name;
        respPokemonSegundo =
            await pokemonService.pokemonDataNameServices(segundoPokemon!);
        if (respPokemonEvol!.chain.evolvesTo[0].evolvesTo!.isNotEmpty) {
          tercerPokemon =
              respPokemonEvol!.chain.evolvesTo[0].evolvesTo![0].species.name;
          respPokemonTercero =
              await pokemonService.pokemonDataNameServices(tercerPokemon!);
        }
      }
    }
    loadDataCards = false;
    setState(() {});
  }

  void selectDescription(List<FlavorTextEntry> listFlavorTextEntry) {
    listFlavorTextEntry.forEach((element) {
      if (element.language.name == 'es') {
        textDescription = element.flavorText;
      }
    });

    setState(() {});
  }

  void changueColor(String color) {
    debugPrint(color);
    colorPokemonText = color;
    if ('red' == color) {
      colorPokemon = Colors.redAccent;
    } else if ('blue' == color) {
      colorPokemon = Colors.blueAccent;
    } else if ('yellow' == color) {
      colorPokemon = Colors.yellow;
    } else if ('green' == color) {
      colorPokemon = Colors.green;
    } else if ('black' == color) {
      colorPokemon = Colors.black54;
    } else if ('brown' == color) {
      colorPokemon = Colors.brown;
    } else if ('purple' == color) {
      colorPokemon = Colors.purpleAccent;
    } else if ('grey' == color) {
      colorPokemon = Colors.grey;
    } else if ('pink' == color) {
      colorPokemon = Colors.pinkAccent;
    } else if ('white' == color) {
      colorPokemon = Colors.white54;
    } else {
      debugPrint(color);
    }
    setState(() {});
  }

  Widget cardPokemonName(String pokemonName, ResponsePokemon respPokemonAux) {
    return Card(
        elevation: 5,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
              child: Text(pokemonName.toUpperCase(),
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PokemonDetallePage(
                            urlPokemon: '', namePokemon: respPokemonAux.name)),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(1),
                  child: FadeInImage(
                    placeholder: const AssetImage('assets/img/pokeball.png'),
                    image: NetworkImage(respPokemonAux.sprites.frontDefault),
                    fit: BoxFit.fill,
                    height: 90,
                    width: 75,
                  ),
                ))
          ],
        ));
  }

  Widget barraColorPokemon(var colorPokemonAux) {
    return Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          padding: const EdgeInsets.all(5),
          color: colorPokemonAux,
        ));
  }

  Widget cardPokemon(String linkPokemonGif) {
    return Card(
        margin: const EdgeInsets.only(left: 15, right: 15),
        elevation: 25,
        color: colorPokemon,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: SizedBox(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/img/pokeball.png'),
                  image: NetworkImage(linkPokemonGif),
                  fit: BoxFit.fill,
                  height: 100,
                  width: 100,
                ),
              )
            ],
          ),
        ));
  }

  Widget headerParrafo(String title) {
    return Container(
      padding: const EdgeInsets.all(5),
      color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
              height: 15,
              width: 15,
              image: AssetImage('assets/img/pokeball.png')),
          const SizedBox(width: 10),
          Flexible(
            flex: 1,
            child: Text(title.toUpperCase(),
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
          const SizedBox(width: 10),
          const Image(
              height: 15,
              width: 15,
              image: AssetImage('assets/img/pokeball.png')),
        ],
      ),
    );
  }

  Widget textInformation(String textoParrajo) {
    return Card(
        elevation: 10,
        color: Colors.redAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Text('INFORMACION',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
                (respPokemonSpecies!.isLegendary == true)
                    ? const Text('LEGENDARIO',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.brown))
                    : Container(),
                (respPokemonSpecies!.isMythical == true)
                    ? const Text('MITICO',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.brown))
                    : Container(),
     
                Text('Experiencia: ${respPokemon!.baseExperience.toString()}',style: const TextStyle(color: Colors.black)),  
                Text('Altura: ${respPokemon!.height.toString()} m',style: const TextStyle(color: Colors.white)),
                Text('Peso: ${respPokemon!.weight.toString()} g',style: const TextStyle(color: Colors.white)),

              ],
            )));
  }

  Widget textParrafo(String textoParrajo) {
    return Card(
        elevation: 25,
        color: Colors.redAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
            padding: const EdgeInsets.only(bottom:20,left: 20,right: 20),
            child: Column(
              children: [
                const SizedBox(height: 10),
                const Text('Descripción',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white)),
                const SizedBox(height: 10),
                RichText(
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.end,
                  textDirection: TextDirection.rtl,
                  softWrap: true,
                  textScaleFactor: 1,
                  text: TextSpan(
                      text: textoParrajo,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                )
              ],
            )));
  }

  Widget conatinerCardsPokemons() {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceEvenly, //Center Row contents horizontally,
      children: [
        (primerPokemon != null)
            ? cardPokemonName(primerPokemon.toString(), respPokemonPrimero!)
            : Container(),
        (segundoPokemon != null)
            ? cardPokemonName(
                segundoPokemon.toString().toString(), respPokemonSegundo!)
            : Container(),
        (tercerPokemon != null)
            ? cardPokemonName(
                tercerPokemon.toString().toString(), respPokemonTercero!)
            : Container(),
      ],
    );
  }

  Widget containerDetail() {
    return Center(
        child: SingleChildScrollView(
      child: Column(children: [
        headerParrafo(widget.namePokemon),
        barraColorPokemon(colorPokemon),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            cardPokemon(respPokemon?.sprites.versions.generationV.blackWhite
                    .animated.frontDefault ??
                'https://assets.pokemon.com/static2/_ui/img/og-default-image.jpeg'),
            textInformation('hoal')
          ],
        ),
                  
        barraColorPokemon(colorPokemon),
        textParrafo(textDescription),
        barraColorPokemon(colorPokemon),
        (loadDataCards == false) ? conatinerCardsPokemons() : Container(),
      ]),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('DETAIL', style: TextStyle(color: Colors.white)),
        ),
        body: (loadData)
            ? const Center(child: CircularProgressIndicator())
            : (respPokemon == null)
                ? const Text('No hay date')
                : containerDetail());
  }
}
