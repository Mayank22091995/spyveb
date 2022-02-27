import 'dart:convert';

FollowModel followModelFromJson(String str) =>
    FollowModel.fromJson(json.decode(str));

String followModelToJson(FollowModel data) => json.encode(data.toJson());

class FollowModel {
  FollowModel({
    this.resultCount,
    this.results,
  });

  int? resultCount;
  List<Result>? results;

  factory FollowModel.fromJson(Map<String, dynamic> json) => FollowModel(
        resultCount: json["resultCount"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "resultCount": resultCount,
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Result {
  Result(
      {this.wrapperType,
      this.artistType,
      this.artistName,
      this.artistLinkUrl,
      this.artistId,
      this.amgArtistId,
      this.primaryGenreName,
      this.primaryGenreId,
      this.collectionType,
      this.collectionId,
      this.collectionName,
      this.collectionCensoredName,
      this.artistViewUrl,
      this.collectionViewUrl,
      this.artworkUrl60,
      this.artworkUrl100,
      this.collectionPrice,
      this.collectionExplicitness,
      this.trackCount,
      this.copyright,
      this.country,
      this.currency,
      this.releaseDate,
      this.contentAdvisoryRating,
      this.follow});

  WrapperType? wrapperType;
  String? artistType;
  String? artistName;
  String? artistLinkUrl;
  int? artistId;
  int? amgArtistId;
  String? primaryGenreName;
  int? primaryGenreId;
  CollectionType? collectionType;
  int? collectionId;
  String? collectionName;
  String? collectionCensoredName;
  String? artistViewUrl;
  String? collectionViewUrl;
  String? artworkUrl60;
  String? artworkUrl100;
  double? collectionPrice;
  CollectionExplicitness? collectionExplicitness;
  int? trackCount;
  String? copyright;
  Country? country;
  Currency? currency;
  DateTime? releaseDate;
  String? contentAdvisoryRating;
  bool? follow;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
      wrapperType: wrapperTypeValues.map![json["wrapperType"]],
      artistType: json["artistType"] == null ? null : json["artistType"],
      artistName: json["artistName"],
      artistLinkUrl:
          json["artistLinkUrl"] == null ? null : json["artistLinkUrl"],
      artistId: json["artistId"],
      amgArtistId: json["amgArtistId"] == null ? null : json["amgArtistId"],
      primaryGenreName: json["primaryGenreName"],
      primaryGenreId:
          json["primaryGenreId"] == null ? null : json["primaryGenreId"],
      collectionType: json["collectionType"] == null
          ? null
          : collectionTypeValues.map![json["collectionType"]],
      collectionId: json["collectionId"] == null ? null : json["collectionId"],
      collectionName:
          json["collectionName"] == null ? null : json["collectionName"],
      collectionCensoredName: json["collectionCensoredName"] == null
          ? null
          : json["collectionCensoredName"],
      artistViewUrl:
          json["artistViewUrl"] == null ? null : json["artistViewUrl"],
      collectionViewUrl:
          json["collectionViewUrl"] == null ? null : json["collectionViewUrl"],
      artworkUrl60: json["artworkUrl60"] == null ? null : json["artworkUrl60"],
      artworkUrl100:
          json["artworkUrl100"] == null ? null : json["artworkUrl100"],
      collectionPrice: json["collectionPrice"] == null
          ? null
          : json["collectionPrice"].toDouble(),
      collectionExplicitness: json["collectionExplicitness"] == null
          ? null
          : collectionExplicitnessValues.map![json["collectionExplicitness"]],
      trackCount: json["trackCount"] == null ? null : json["trackCount"],
      copyright: json["copyright"] == null ? null : json["copyright"],
      country:
          json["country"] == null ? null : countryValues.map![json["country"]],
      currency: json["currency"] == null
          ? null
          : currencyValues.map![json["currency"]],
      releaseDate: json["releaseDate"] == null
          ? null
          : DateTime.parse(json["releaseDate"]),
      contentAdvisoryRating: json["contentAdvisoryRating"] == null
          ? null
          : json["contentAdvisoryRating"],
      follow: json["follow"] == null ? false : json["follow"]);

  Map<String, dynamic> toJson() => {
        "wrapperType": wrapperTypeValues.reverse![wrapperType],
        "artistType": artistType == null ? null : artistType,
        "artistName": artistName,
        "artistLinkUrl": artistLinkUrl == null ? null : artistLinkUrl,
        "artistId": artistId,
        "amgArtistId": amgArtistId == null ? null : amgArtistId,
        "primaryGenreName": primaryGenreName,
        "primaryGenreId": primaryGenreId == null ? null : primaryGenreId,
        "collectionType": collectionType == null
            ? null
            : collectionTypeValues.reverse![collectionType],
        "collectionId": collectionId == null ? null : collectionId,
        "collectionName": collectionName == null ? null : collectionName,
        "collectionCensoredName":
            collectionCensoredName == null ? null : collectionCensoredName,
        "artistViewUrl": artistViewUrl == null ? null : artistViewUrl,
        "collectionViewUrl":
            collectionViewUrl == null ? null : collectionViewUrl,
        "artworkUrl60": artworkUrl60 == null ? null : artworkUrl60,
        "artworkUrl100": artworkUrl100 == null ? null : artworkUrl100,
        "collectionPrice": collectionPrice == null ? null : collectionPrice,
        "collectionExplicitness": collectionExplicitness == null
            ? null
            : collectionExplicitnessValues.reverse![collectionExplicitness],
        "trackCount": trackCount == null ? null : trackCount,
        "copyright": copyright == null ? null : copyright,
        "country": country == null ? null : countryValues.reverse![country],
        "currency": currency == null ? null : currencyValues.reverse![currency],
        "releaseDate":
            releaseDate == null ? null : releaseDate!.toIso8601String(),
        "contentAdvisoryRating":
            contentAdvisoryRating == null ? null : contentAdvisoryRating,
        "follow": follow == null ? false : follow
      };
}

enum CollectionExplicitness { NOT_EXPLICIT, EXPLICIT }

final collectionExplicitnessValues = EnumValues({
  "explicit": CollectionExplicitness.EXPLICIT,
  "notExplicit": CollectionExplicitness.NOT_EXPLICIT
});

enum CollectionType { ALBUM }

final collectionTypeValues = EnumValues({"Album": CollectionType.ALBUM});

enum Country { USA }

final countryValues = EnumValues({"USA": Country.USA});

enum Currency { USD }

final currencyValues = EnumValues({"USD": Currency.USD});

enum WrapperType { ARTIST, COLLECTION }

final wrapperTypeValues = EnumValues(
    {"artist": WrapperType.ARTIST, "collection": WrapperType.COLLECTION});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
