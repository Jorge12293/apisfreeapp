import 'package:apisfreeapp/src/ui/pages/home_page.dart';
import 'package:apisfreeapp/src/ui/pages/pokemon_page/pokemon_page.dart';
import 'package:flutter/cupertino.dart';


final Map<String,Widget Function(BuildContext)> appRoutes ={
 'home' : ( _ ) => const HomePage(), 
 'pokemonPage' : ( _ ) => const PokemonPage(),  
};