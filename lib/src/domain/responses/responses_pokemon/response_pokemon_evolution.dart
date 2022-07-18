import 'dart:convert';

class ResponsePokemonEvolution {
    ResponsePokemonEvolution({
        required  this.chain,
        required  this.id,
    });

    Chain chain;
    int id;

    factory ResponsePokemonEvolution.fromJson(String str) => ResponsePokemonEvolution.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ResponsePokemonEvolution.fromMap(Map<String, dynamic> json) => ResponsePokemonEvolution(
        chain: Chain.fromMap(json["chain"]),
        id: json["id"],
    );

    Map<String, dynamic> toMap() => {
        "chain": chain.toMap(),
        "id": id,
    };
}

class Chain {
    Chain({
        required  this.evolvesTo,
        required  this.isBaby,
        required  this.species,
    });

    List<ChainEvolvesTo> evolvesTo;
    bool isBaby;
    Species species;

    factory Chain.fromJson(String str) => Chain.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Chain.fromMap(Map<String, dynamic> json) => Chain(
        evolvesTo: List<ChainEvolvesTo>.from(json["evolves_to"].map((x) => ChainEvolvesTo.fromMap(x))),
        isBaby: json["is_baby"],
        species: Species.fromMap(json["species"]),
    );

    Map<String, dynamic> toMap() => {
        "evolves_to": List<dynamic>.from(evolvesTo.map((x) => x.toMap())),
        "is_baby": isBaby,
        "species": species.toMap(),
    };
}

class ChainEvolvesTo {
    ChainEvolvesTo({
        required  this.evolvesTo,
        required  this.isBaby,
        required  this.species,
    });

    List<EvolvesToEvolvesTo>? evolvesTo;
    bool isBaby;
    Species species;

    factory ChainEvolvesTo.fromJson(String str) => ChainEvolvesTo.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ChainEvolvesTo.fromMap(Map<String, dynamic> json) => ChainEvolvesTo(
        evolvesTo: List<EvolvesToEvolvesTo>.from(json["evolves_to"].map((x) => EvolvesToEvolvesTo.fromMap(x))),
        isBaby: json["is_baby"],
        species: Species.fromMap(json["species"]),
    );

    Map<String, dynamic> toMap() => {
        "evolves_to": List<dynamic>.from(evolvesTo!.map((x) => x.toMap())),
        "is_baby": isBaby,
        "species": species.toMap(),
    };
}

class EvolvesToEvolvesTo {
    EvolvesToEvolvesTo({
        required  this.isBaby,
        required  this.species,
    });

    bool isBaby;
    Species species;

    factory EvolvesToEvolvesTo.fromJson(String str) => EvolvesToEvolvesTo.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory EvolvesToEvolvesTo.fromMap(Map<String, dynamic> json) => EvolvesToEvolvesTo(
        isBaby: json["is_baby"],
        species: Species.fromMap(json["species"]),
    );

    Map<String, dynamic> toMap() => {
        "is_baby": isBaby,
        "species": species.toMap(),
    };
}

class Species {
    Species({
        required  this.name,
        required  this.url,
    });

    String name;
    String url;

    factory Species.fromJson(String str) => Species.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Species.fromMap(Map<String, dynamic> json) => Species(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
    };
}
