import 'dart:convert';

class ResponsePokemonList {
    ResponsePokemonList({
        required this.count,
        this.next,
        this.previous,
        required this.pokemonNameList,
    });

    int count;
    String? next;
    String? previous;
    List<PokemonName> pokemonNameList;

    factory ResponsePokemonList.fromJson(String str) => ResponsePokemonList.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ResponsePokemonList.fromMap(Map<String, dynamic> json) => ResponsePokemonList(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        pokemonNameList: List<PokemonName>.from(json["results"].map((x) => PokemonName.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(pokemonNameList.map((x) => x.toMap())),
    };
}

class PokemonName {
    PokemonName({
        required this.name,
        required this.url,
    });

    String name;
    String url;

    factory PokemonName.fromJson(String str) => PokemonName.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PokemonName.fromMap(Map<String, dynamic> json) => PokemonName(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
    };
}
