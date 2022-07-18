import 'package:apisfreeapp/src/data/http/urls_global/urls_global.dart';

class UrlsServicesPokemon {
  String getPokemon = '${UrlsGlobal.urlGlobalPokemon}api/v2/pokemon/';
  String getPokemonDataSpecie = '${UrlsGlobal.urlGlobalPokemon}api/v2/pokemon-species/';
}
