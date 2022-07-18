import 'dart:convert';

class ResponsePokemonDetalle {
    ResponsePokemonDetalle({
        required this.baseExperience,
        required this.sprites,
        required this.weight,
    });

    int baseExperience;
    Sprites sprites;
    int weight;

    factory ResponsePokemonDetalle.fromJson(String str) => ResponsePokemonDetalle.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ResponsePokemonDetalle.fromMap(Map<String, dynamic> json) => ResponsePokemonDetalle(
        baseExperience: json["base_experience"],
        sprites: Sprites.fromMap(json["sprites"]),
        weight: json["weight"],
    );

    Map<String, dynamic> toMap() => {
        "base_experience": baseExperience,
        "sprites": sprites.toMap(),
        "weight": weight,
    };
}

class Sprites {
    Sprites({
        required this.backDefault,
        required this.frontDefault,
    });

    String backDefault;
    String frontDefault;

    factory Sprites.fromJson(String str) => Sprites.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Sprites.fromMap(Map<String, dynamic> json) => Sprites(
        backDefault: json["back_default"],
        frontDefault: json["front_default"],
    );

    Map<String, dynamic> toMap() => {
        "back_default": backDefault,
        "front_default": frontDefault,
    };
}
