import 'dart:convert';

class ResponsePokemonSpecies {
    ResponsePokemonSpecies({
        required  this.color,
        required this.eggGroups,
        required  this.evolutionChain,
        required  this.flavorTextEntries,
        required  this.growthRate,
        required  this.habitat,
        required  this.hasGenderDifferences,
        required  this.hatchCounter,
        required  this.id,
        required  this.isBaby,
        required  this.isLegendary,
        required  this.isMythical,
        required  this.name,
        required  this.palParkEncounters,
        required  this.varieties,
    });

    Color color;
    List<Color> eggGroups;
    EvolutionChain evolutionChain;
    List<FlavorTextEntry> flavorTextEntries;
    Color growthRate;
    Color habitat;
    bool hasGenderDifferences;
    int hatchCounter;
    int id;
    bool isBaby;
    bool isLegendary;
    bool isMythical;
    String name;
    List<PalParkEncounter> palParkEncounters;
    List<Variety> varieties;

    factory ResponsePokemonSpecies.fromJson(String str) => ResponsePokemonSpecies.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ResponsePokemonSpecies.fromMap(Map<String, dynamic> json) => ResponsePokemonSpecies(
        color: Color.fromMap(json["color"]),
        eggGroups: List<Color>.from(json["egg_groups"].map((x) => Color.fromMap(x))),
        evolutionChain: EvolutionChain.fromMap(json["evolution_chain"]),
        flavorTextEntries: List<FlavorTextEntry>.from(json["flavor_text_entries"].map((x) => FlavorTextEntry.fromMap(x))),
        growthRate: Color.fromMap(json["growth_rate"]),
        habitat: Color.fromMap(json["habitat"]),
        hasGenderDifferences: json["has_gender_differences"],
        hatchCounter: json["hatch_counter"],
        id: json["id"],
        isBaby: json["is_baby"],
        isLegendary: json["is_legendary"],
        isMythical: json["is_mythical"],
        name: json["name"],
        palParkEncounters: List<PalParkEncounter>.from(json["pal_park_encounters"].map((x) => PalParkEncounter.fromMap(x))),
        varieties: List<Variety>.from(json["varieties"].map((x) => Variety.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "color": color.toMap(),
        "egg_groups": List<dynamic>.from(eggGroups.map((x) => x.toMap())),
        "evolution_chain": evolutionChain.toMap(),
        "flavor_text_entries": List<dynamic>.from(flavorTextEntries.map((x) => x.toMap())),
        "growth_rate": growthRate.toMap(),
        "habitat": habitat.toMap(),
        "has_gender_differences": hasGenderDifferences,
        "hatch_counter": hatchCounter,
        "id": id,
        "is_baby": isBaby,
        "is_legendary": isLegendary,
        "is_mythical": isMythical,
        "name": name,
        "pal_park_encounters": List<dynamic>.from(palParkEncounters.map((x) => x.toMap())),
        "varieties": List<dynamic>.from(varieties.map((x) => x.toMap())),
    };
}

class Color {
    Color({
        required  this.name,
        required  this.url,
    });

    String name;
    String url;

    factory Color.fromJson(String str) => Color.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Color.fromMap(Map<String, dynamic> json) => Color(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
    };
}

class EvolutionChain {
    EvolutionChain({
        required  this.url,
    });

    String url;

    factory EvolutionChain.fromJson(String str) => EvolutionChain.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory EvolutionChain.fromMap(Map<String, dynamic> json) => EvolutionChain(
        url: json["url"],
    );

    Map<String, dynamic> toMap() => {
        "url": url,
    };
}

class FlavorTextEntry {
    FlavorTextEntry({
        required  this.flavorText,
        required  this.language,
    });

    String flavorText;
    Color language;

    factory FlavorTextEntry.fromJson(String str) => FlavorTextEntry.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory FlavorTextEntry.fromMap(Map<String, dynamic> json) => FlavorTextEntry(
        flavorText: json["flavor_text"],
        language: Color.fromMap(json["language"]),
    );

    Map<String, dynamic> toMap() => {
        "flavor_text": flavorText,
        "language": language.toMap(),
    };
}

class PalParkEncounter {
    PalParkEncounter({
        required  this.area,
        required  this.baseScore,
        required  this.rate,
    });

    Color area;
    int baseScore;
    int rate;

    factory PalParkEncounter.fromJson(String str) => PalParkEncounter.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PalParkEncounter.fromMap(Map<String, dynamic> json) => PalParkEncounter(
        area: Color.fromMap(json["area"]),
        baseScore: json["base_score"],
        rate: json["rate"],
    );

    Map<String, dynamic> toMap() => {
        "area": area.toMap(),
        "base_score": baseScore,
        "rate": rate,
    };
}

class Variety {
    Variety({
        required  this.isDefault,
        required  this.pokemon,
    });

    bool isDefault;
    Color pokemon;

    factory Variety.fromJson(String str) => Variety.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Variety.fromMap(Map<String, dynamic> json) => Variety(
        isDefault: json["is_default"],
        pokemon: Color.fromMap(json["pokemon"]),
    );

    Map<String, dynamic> toMap() => {
        "is_default": isDefault,
        "pokemon": pokemon.toMap(),
    };
}
