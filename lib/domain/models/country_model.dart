// To parse this JSON data, do
//
//     final countryModel = countryModelFromJson(jsonString);

import 'dart:convert';

List<CountryModel> countryModelFromJson(String str) => List<CountryModel>.from(
    json.decode(str).map((x) => CountryModel.fromJson(x)));

String countryModelToJson(List<CountryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryModel {
  final Name name;
  final List<String> capital;
  final Region region;
  final Map<String, String> languages;
  final List<Continent> continents;

  CountryModel({
    required this.name,
    required this.capital,
    required this.region,
    required this.languages,
    required this.continents,
  });

  CountryModel copyWith({
    Name? name,
    List<String>? tld,
    List<String>? capital,
    List<String>? altSpellings,
    Region? region,
    Map<String, String>? languages,
    Map<String, Translation>? translations,
    List<double>? latlng,
    bool? landlocked,
    double? area,
    Demonyms? demonyms,
    String? flag,
    Maps? maps,
    int? population,
    Car? car,
    List<String>? timezones,
    List<Continent>? continents,
    Flags? flags,
    CoatOfArms? coatOfArms,
    StartOfWeek? startOfWeek,
    CapitalInfo? capitalInfo,
    String? cioc,
    String? subregion,
    String? fifa,
    List<String>? borders,
    Map<String, double>? gini,
    PostalCode? postalCode,
  }) =>
      CountryModel(
          name: name ?? this.name,
          capital: capital ?? this.capital,
          region: region ?? this.region,
          languages: languages ?? this.languages,
          continents: continents ?? this.continents,);

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    print(json);
    return CountryModel(
      name: Name.fromJson(json["name"] ?? 'No tiene nombre'),
      capital: List<String>.from(
          (json["capital"] == null) ? '' : json["capital"].map((x) => x ?? '')),
      region: regionValues.map[json["region"]] ?? Region.UNKNOWN,
      languages: json["languages"] == null
          ? {}
          : Map.from(json["languages"])
              .map((k, v) => MapEntry<String, String>(k ?? '', v ?? '')),
      continents: json["continents"] == null
          ? []
          : List<Continent>.from(
              json["continents"].map((x) => continentValues.map[x?? ''])),
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name.toJson(),
        "capital": List<dynamic>.from(capital.map((x) => x)),
        "region": regionValues.reverse[region],
        "languages":
            Map.from(languages).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "continents": List<dynamic>.from(
            continents.map((x) => continentValues.reverse[x])),
      };
}

class CapitalInfo {
  final List<double> latlng;

  CapitalInfo({
    required this.latlng,
  });

  CapitalInfo copyWith({
    List<double>? latlng,
  }) =>
      CapitalInfo(
        latlng: latlng ?? this.latlng,
      );

  factory CapitalInfo.fromJson(Map<String, dynamic> json) => CapitalInfo(
        latlng: List<double>.from(json["latlng"].map((x) => x.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "latlng": List<dynamic>.from(latlng.map((x) => x)),
      };
}

class Car {
  final List<String> signs;
  final Side side;

  Car({
    required this.signs,
    required this.side,
  });

  Car copyWith({
    List<String>? signs,
    Side? side,
  }) =>
      Car(
        signs: signs ?? this.signs,
        side: side ?? this.side,
      );

  factory Car.fromJson(Map<String, dynamic> json) => Car(
        signs: List<String>.from(json["signs"].map((x) => x)),
        side: sideValues.map[json["side"]] ?? Side.LEFT,
      );

  Map<String, dynamic> toJson() => {
        "signs": List<dynamic>.from(signs.map((x) => x)),
        "side": sideValues.reverse[side],
      };
}

enum Side { LEFT, RIGHT, UNKNOWN }

final sideValues = EnumValues({"left": Side.LEFT, "right": Side.UNKNOWN});

class CoatOfArms {
  final String png;
  final String svg;

  CoatOfArms({
    required this.png,
    required this.svg,
  });

  CoatOfArms copyWith({
    String? png,
    String? svg,
  }) =>
      CoatOfArms(
        png: png ?? this.png,
        svg: svg ?? this.svg,
      );

  factory CoatOfArms.fromJson(Map<String, dynamic> json) => CoatOfArms(
        png: json["png"],
        svg: json["svg"],
      );

  Map<String, dynamic> toJson() => {
        "png": png,
        "svg": svg,
      };
}

enum Continent {
  AFRICA,
  ANTARCTICA,
  ASIA,
  EUROPE,
  NORTH_AMERICA,
  OCEANIA,
  SOUTH_AMERICA,
  UNKNOWN
}

final continentValues = EnumValues({
  "Africa": Continent.AFRICA,
  "Antarctica": Continent.ANTARCTICA,
  "Asia": Continent.ASIA,
  "Europe": Continent.EUROPE,
  "North America": Continent.NORTH_AMERICA,
  "Oceania": Continent.OCEANIA,
  "South America": Continent.SOUTH_AMERICA
});

class Currency {
  final String name;
  final String symbol;

  Currency({
    required this.name,
    required this.symbol,
  });

  Currency copyWith({
    String? name,
    String? symbol,
  }) =>
      Currency(
        name: name ?? this.name,
        symbol: symbol ?? this.symbol,
      );

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        name: json["name"],
        symbol: json["symbol"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "symbol": symbol,
      };
}

class Demonyms {
  final Eng eng;
  final Eng fra;

  Demonyms({
    required this.eng,
    required this.fra,
  });

  Demonyms copyWith({
    Eng? eng,
    Eng? fra,
  }) =>
      Demonyms(
        eng: eng ?? this.eng,
        fra: fra ?? this.fra,
      );

  factory Demonyms.fromJson(Map<String, dynamic> json) => Demonyms(
        eng: Eng.fromJson(json["eng"]),
        fra: Eng.fromJson(json["fra"]),
      );

  Map<String, dynamic> toJson() => {
        "eng": eng.toJson(),
        "fra": fra.toJson(),
      };
}

class Eng {
  final String f;
  final String m;

  Eng({
    required this.f,
    required this.m,
  });

  Eng copyWith({
    String? f,
    String? m,
  }) =>
      Eng(
        f: f ?? this.f,
        m: m ?? this.m,
      );

  factory Eng.fromJson(Map<String, dynamic> json) => Eng(
        f: json["f"],
        m: json["m"],
      );

  Map<String, dynamic> toJson() => {
        "f": f,
        "m": m,
      };
}

class Flags {
  final String png;
  final String svg;
  final String alt;

  Flags({
    required this.png,
    required this.svg,
    required this.alt,
  });

  Flags copyWith({
    String? png,
    String? svg,
    String? alt,
  }) =>
      Flags(
        png: png ?? this.png,
        svg: svg ?? this.svg,
        alt: alt ?? this.alt,
      );

  factory Flags.fromJson(Map<String, dynamic> json) => Flags(
        png: json["png"],
        svg: json["svg"],
        alt: json["alt"],
      );

  Map<String, dynamic> toJson() => {
        "png": png,
        "svg": svg,
        "alt": alt,
      };
}

class Idd {
  final String root;
  final List<String> suffixes;

  Idd({
    required this.root,
    required this.suffixes,
  });

  Idd copyWith({
    String? root,
    List<String>? suffixes,
  }) =>
      Idd(
        root: root ?? this.root,
        suffixes: suffixes ?? this.suffixes,
      );

  factory Idd.fromJson(Map<String, dynamic> json) => Idd(
        root: json["root"],
        suffixes: List<String>.from(json["suffixes"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "root": root,
        "suffixes": List<dynamic>.from(suffixes.map((x) => x)),
      };
}

class Maps {
  final String googleMaps;
  final String openStreetMaps;

  Maps({
    required this.googleMaps,
    required this.openStreetMaps,
  });

  Maps copyWith({
    String? googleMaps,
    String? openStreetMaps,
  }) =>
      Maps(
        googleMaps: googleMaps ?? this.googleMaps,
        openStreetMaps: openStreetMaps ?? this.openStreetMaps,
      );

  factory Maps.fromJson(Map<String, dynamic> json) => Maps(
        googleMaps: json["googleMaps"],
        openStreetMaps: json["openStreetMaps"],
      );

  Map<String, dynamic> toJson() => {
        "googleMaps": googleMaps,
        "openStreetMaps": openStreetMaps,
      };
}

class Name {
  final String common;
  final String official;
  final Map<String, Translation> nativeName;

  Name({
    required this.common,
    required this.official,
    required this.nativeName,
  });

  Name copyWith({
    String? common,
    String? official,
    Map<String, Translation>? nativeName,
  }) =>
      Name(
        common: common ?? this.common,
        official: official ?? this.official,
        nativeName: nativeName ?? this.nativeName,
      );

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        common: json["common"],
        official: json["official"],
        nativeName: Map.from(json["nativeName"]).map((k, v) =>
            MapEntry<String, Translation>(k, Translation.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "common": common,
        "official": official,
        "nativeName": Map.from(nativeName)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class Translation {
  final String official;
  final String common;

  Translation({
    required this.official,
    required this.common,
  });

  Translation copyWith({
    String? official,
    String? common,
  }) =>
      Translation(
        official: official ?? this.official,
        common: common ?? this.common,
      );

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        official: json["official"],
        common: json["common"],
      );

  Map<String, dynamic> toJson() => {
        "official": official,
        "common": common,
      };
}

class PostalCode {
  final String format;
  final String regex;

  PostalCode({
    required this.format,
    required this.regex,
  });

  PostalCode copyWith({
    String? format,
    String? regex,
  }) =>
      PostalCode(
        format: format ?? this.format,
        regex: regex ?? this.regex,
      );

  factory PostalCode.fromJson(Map<String, dynamic> json) => PostalCode(
        format: json["format"],
        regex: json["regex"],
      );

  Map<String, dynamic> toJson() => {
        "format": format,
        "regex": regex,
      };
}

enum Region { AFRICA, AMERICAS, ANTARCTIC, ASIA, EUROPE, OCEANIA, UNKNOWN }

final regionValues = EnumValues({
  "Africa": Region.AFRICA,
  "Americas": Region.AMERICAS,
  "Antarctic": Region.ANTARCTIC,
  "Asia": Region.ASIA,
  "Europe": Region.EUROPE,
  "Oceania": Region.OCEANIA
});

enum StartOfWeek { MONDAY, SATURDAY, SUNDAY, UNKNOWN }

final startOfWeekValues = EnumValues({
  "monday": StartOfWeek.MONDAY,
  "saturday": StartOfWeek.SATURDAY,
  "sunday": StartOfWeek.SUNDAY
});

enum Status { OFFICIALLY_ASSIGNED, USER_ASSIGNED, UNKNOWN }

final statusValues = EnumValues({
  "officially-assigned": Status.OFFICIALLY_ASSIGNED,
  "user-assigned": Status.USER_ASSIGNED
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
