import 'package:apisfreeapp/src/data/http/urls_services/urls_services_pokemon.dart';
import 'package:apisfreeapp/src/domain/responses/responses_pokemon/response_pokemon.dart';
import 'package:apisfreeapp/src/domain/responses/responses_pokemon/response_pokemon_detalle.dart';
import 'package:apisfreeapp/src/domain/responses/responses_pokemon/response_pokemon_evolution.dart';
import 'package:apisfreeapp/src/domain/responses/responses_pokemon/response_pokemon_list.dart';
import 'package:apisfreeapp/src/domain/responses/responses_pokemon/response_pokemon_species.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PokemonServices {
  UrlsServicesPokemon urlPokemon = UrlsServicesPokemon();

  Future<ResponsePokemonList?> getPokemonListServices() async {
    ResponsePokemonList? respPokemonList;
    try {
      var url = Uri.parse(urlPokemon.getPokemon);
      debugPrint(urlPokemon.getPokemon);
      final resp = await http.get(url);
      if (resp.statusCode == 200) {
        respPokemonList = ResponsePokemonList.fromJson(resp.body);
        return respPokemonList;
      } else {
        debugPrint('Fallo Conexion: ${resp.statusCode}');
        return respPokemonList;
      }
    } catch (e) {
      debugPrint(e.toString());
      return respPokemonList;
    }
  }

  Future<ResponsePokemonList?> getPokemonListUrlServices(
      String urlPokemon) async {
    ResponsePokemonList? respPokemonList;
    try {
      var url = Uri.parse(urlPokemon);
      debugPrint(urlPokemon);
      final resp = await http.get(url);
      if (resp.statusCode == 200) {
        respPokemonList = ResponsePokemonList.fromJson(resp.body);
        return respPokemonList;
      } else {
        debugPrint('Fallo Conexion: ${resp.statusCode}');
        return respPokemonList;
      }
    } catch (e) {
      debugPrint(e.toString());
      return respPokemonList;
    }
  }

  Future<ResponsePokemonDetalle?> detallePokemonServices(
      String namePokemon) async {
    ResponsePokemonDetalle? respPokemonDetalle;
    try {
      var url = Uri.parse(urlPokemon.getPokemon + '$namePokemon/');
      debugPrint(urlPokemon.getPokemon + '$namePokemon/');
      final resp = await http.get(url);
      if (resp.statusCode == 200) {
        respPokemonDetalle = ResponsePokemonDetalle.fromJson(resp.body);
        return respPokemonDetalle;
      }
      return respPokemonDetalle;
    } catch (e) {
      debugPrint(e.toString());
      return respPokemonDetalle;
    }
  }

  Future<ResponsePokemon?> pokemonDataServices(String urlPokemon) async{
    ResponsePokemon? respPokemon;
    try {
      var url = Uri.parse(urlPokemon);
      debugPrint(urlPokemon);
      final resp = await http.get(url);
      if (resp.statusCode == 200) {
        respPokemon = ResponsePokemon.fromJson(resp.body);
        return respPokemon;
      } else {
        debugPrint('Fallo Conexion: ${resp.statusCode}');
        return respPokemon;
      }  
    } catch (e) {
      debugPrint(e.toString());
      return respPokemon;
    }
  }

  Future<ResponsePokemon?> pokemonDataNameServices(String namePokemon) async{
    
    ResponsePokemon? respPokemon;
    try {
      var url = Uri.parse(urlPokemon.getPokemon+'$namePokemon/');
      debugPrint(urlPokemon.getPokemon+'$namePokemon/');
      final resp = await http.get(url);
      if (resp.statusCode == 200) {
        respPokemon = ResponsePokemon.fromJson(resp.body);
        return respPokemon;
      } else {
        debugPrint('Fallo Conexion: ${resp.statusCode}');
        return respPokemon;
      }  
    } catch (e) {
      debugPrint(e.toString());
      return respPokemon;
    }
    
  }

  Future<ResponsePokemonSpecies?> pokemonDataSpecieServices(int idPokemon) async{
    ResponsePokemonSpecies? respPokemonSpecies;
    try {
      var url = Uri.parse(urlPokemon.getPokemonDataSpecie + '$idPokemon/');
      debugPrint(urlPokemon.getPokemonDataSpecie + '$idPokemon/');
      final resp = await http.get(url);
      if (resp.statusCode == 200) {
        respPokemonSpecies = ResponsePokemonSpecies.fromJson(resp.body);
        return respPokemonSpecies;
      } else {
        debugPrint('Fallo Conexion: ${resp.statusCode}');
        return respPokemonSpecies;
      }  
    } catch (e) {
      debugPrint(e.toString());
      return respPokemonSpecies;
    }
  }

  Future<ResponsePokemonEvolution?> pokemonEvolutionServices(String urlPokemon) async{
    ResponsePokemonEvolution? respPokemonEvol;
      try {
        var url = Uri.parse(urlPokemon);
        debugPrint(urlPokemon);
        final resp = await http.get(url);
        if (resp.statusCode == 200) {
          respPokemonEvol = ResponsePokemonEvolution.fromJson(resp.body);
          return respPokemonEvol;
        } else {
          debugPrint('Fallo Conexion: ${resp.statusCode}');
          return respPokemonEvol;
        }  
      } catch (e) {
        debugPrint(e.toString());
        return respPokemonEvol;
      }
  }



}
