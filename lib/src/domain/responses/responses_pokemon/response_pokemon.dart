import 'dart:convert';

class ResponsePokemon {
    ResponsePokemon({
        required  this.baseExperience,
        required  this.height,
        required  this.id,
        required  this.name,
        required  this.order,
        required  this.moves,
        required  this.sprites,
        required  this.types,
        required  this.weight,
    });

    int baseExperience;
    int height;
    int id;
    String name;
    int order;
    List<MoveElement> moves;
    Sprites sprites;
    List<Type> types;
    int weight;

    factory ResponsePokemon.fromJson(String str) => ResponsePokemon.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ResponsePokemon.fromMap(Map<String, dynamic> json) => ResponsePokemon(
        baseExperience: json["base_experience"],
        height: json["height"],
        id: json["id"],
        name: json["name"],
        order: json["order"],
        moves: List<MoveElement>.from(json["moves"].map((x) => MoveElement.fromMap(x))),
        sprites: Sprites.fromMap(json["sprites"]),
        types: List<Type>.from(json["types"].map((x) => Type.fromMap(x))),
        weight: json["weight"],
    );

    Map<String, dynamic> toMap() => {
        "base_experience": baseExperience,
        "height": height,
        "id": id,
        "name": name,
        "order": order,
        "moves": List<dynamic>.from(moves.map((x) => x.toMap())),
        "sprites": sprites.toMap(),
        "types": List<dynamic>.from(types.map((x) => x.toMap())),
        "weight": weight,
    };
}

class MoveElement {
    MoveElement({
        required  this.move,
    });

    TypeClass move;

    factory MoveElement.fromJson(String str) => MoveElement.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory MoveElement.fromMap(Map<String, dynamic> json) => MoveElement(
        move: TypeClass.fromMap(json["move"]),
    );

    Map<String, dynamic> toMap() => {
        "move": move.toMap(),
    };
}

class TypeClass {
    TypeClass({
        required  this.name,
        required  this.url,
    });

    String name;
    String url;

    factory TypeClass.fromJson(String str) => TypeClass.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory TypeClass.fromMap(Map<String, dynamic> json) => TypeClass(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
    };
}

class Sprites {
    Sprites({
        required  this.versions,
        required this.backDefault,
        required this.frontDefault,
    });

    Versions versions;
    String backDefault;
    String frontDefault;

    factory Sprites.fromJson(String str) => Sprites.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Sprites.fromMap(Map<String, dynamic> json) => Sprites(
        versions: Versions.fromMap(json["versions"]),
        backDefault: json["back_default"],
        frontDefault: json["front_default"],
    );

    Map<String, dynamic> toMap() => {
        "versions": versions.toMap(),
         "back_default": backDefault,
        "front_default": frontDefault,
    };
}

class Versions {
    Versions({
        required  this.generationV,
    });

    GenerationV generationV;

    factory Versions.fromJson(String str) => Versions.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Versions.fromMap(Map<String, dynamic> json) => Versions(
        generationV: GenerationV.fromMap(json["generation-v"]),
    );

    Map<String, dynamic> toMap() => {
        "generation-v": generationV.toMap(),
    };
}

class GenerationV {
    GenerationV({
        required  this.blackWhite,
    });

    BlackWhite blackWhite;

    factory GenerationV.fromJson(String str) => GenerationV.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GenerationV.fromMap(Map<String, dynamic> json) => GenerationV(
        blackWhite: BlackWhite.fromMap(json["black-white"]),
    );

    Map<String, dynamic> toMap() => {
        "black-white": blackWhite.toMap(),
    };
}

class BlackWhite {
    BlackWhite({
        required  this.animated,
        required  this.backDefault,
        required  this.frontDefault,
    });

    Animated animated;
    String backDefault;
    String frontDefault;

    factory BlackWhite.fromJson(String str) => BlackWhite.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory BlackWhite.fromMap(Map<String, dynamic> json) => BlackWhite(
        animated: Animated.fromMap(json["animated"]),
        backDefault: json["back_default"],
        frontDefault: json["front_default"],
    );

    Map<String, dynamic> toMap() => {
        "animated": animated.toMap(),
        "back_default": backDefault,
        "front_default": frontDefault,
    };
}

class Animated {
    Animated({
        required  this.backDefault,
        required  this.frontDefault,
    });

    String backDefault;
    String frontDefault;

    factory Animated.fromJson(String str) => Animated.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Animated.fromMap(Map<String, dynamic> json) => Animated(
        backDefault: json["back_default"],
        frontDefault: json["front_default"],
    );

    Map<String, dynamic> toMap() => {
        "back_default": backDefault,
        "front_default": frontDefault,
    };
}

class Type {
    Type({
        required  this.slot,
        required  this.type,
    });

    int slot;
    TypeClass type;

    factory Type.fromJson(String str) => Type.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Type.fromMap(Map<String, dynamic> json) => Type(
        slot: json["slot"],
        type: TypeClass.fromMap(json["type"]),
    );

    Map<String, dynamic> toMap() => {
        "slot": slot,
        "type": type.toMap(),
    };
}
