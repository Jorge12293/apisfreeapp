import 'package:apisfreeapp/src/data/http/services/pokemon_services.dart';
import 'package:apisfreeapp/src/domain/responses/responses_pokemon/response_pokemon_list.dart';
import 'package:apisfreeapp/src/ui/pages/pokemon_page/widgets/pokemon_page_widget.dart';
import 'package:flutter/material.dart';

class PokemonPage extends StatefulWidget {
  const PokemonPage({Key? key}) : super(key: key);
  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  PokemonPageWidget pokPageWidget = PokemonPageWidget();
  PokemonServices pokemonService = PokemonServices();
  ResponsePokemonList? respPokemonList;
  bool loadData = false;

  @override
  void initState() {
    loadDataPokemonList();
    super.initState();
  }

  void loadDataPokemonList() async {
    loadData = true;
    setState(() {});
    respPokemonList = await pokemonService.getPokemonListServices();
    setState(() {});
    loadData = false;
  }

  void loadDataPokemonListUpdate(String urlPokemon) async {
    loadData = true;
    setState(() {});
    respPokemonList =
        await pokemonService.getPokemonListUrlServices(urlPokemon);
    setState(() {});
    loadData = false;
  }

  Widget dataPokemonView() {
    return Column(
      children: [
        const SizedBox(height: 15),
        Expanded(child: pokPageWidget.listPokemon(respPokemonList!)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            (respPokemonList!.previous == null)
                ? Container()
                : ElevatedButton(
                    onPressed: () {
                      loadDataPokemonListUpdate(
                          respPokemonList!.previous ?? '');
                    },
                    child: const Text('Previous')),
            (respPokemonList!.next == null)
                ? Container()
                : ElevatedButton(
                    onPressed: () {
                      loadDataPokemonListUpdate(respPokemonList!.next ?? '');
                    },
                    child: const Text('Next'))
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text('List Pokemon'),
            ),
            body: (loadData == true)
                ? const Center(child: CircularProgressIndicator())
                : (respPokemonList == null)
                    ? const Text('No hay lista de pokemons')
                    : dataPokemonView()));
  }
}
