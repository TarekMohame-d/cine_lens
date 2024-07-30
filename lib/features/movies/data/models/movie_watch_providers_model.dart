import 'package:json_annotation/json_annotation.dart';
part 'movie_watch_providers_model.g.dart';

@JsonSerializable()
class MovieWatchProviderModel {
  int? id;
  @JsonKey(name: 'results')
  Country? country;

  MovieWatchProviderModel({
    this.id,
    this.country,
  });

  factory MovieWatchProviderModel.fromJson(Map<String, dynamic> json) =>
      _$MovieWatchProviderModelFromJson(json);
  Map<String, dynamic> toJson() => _$MovieWatchProviderModelToJson(this);
}

@JsonSerializable()
class Country {
  @JsonKey(name: 'AR')
  Country? aR;
  @JsonKey(name: 'AT')
  Country? aT;
  @JsonKey(name: 'AU')
  Country? aU;
  @JsonKey(name: 'BO')
  Country? bO;
  @JsonKey(name: 'BR')
  Country? bR;
  @JsonKey(name: 'CA')
  Country? cA;
  @JsonKey(name: 'CH')
  Country? cH;
  @JsonKey(name: 'CL')
  Country? cL;
  @JsonKey(name: 'CO')
  Country? cO;
  @JsonKey(name: 'CR')
  Country? cR;
  @JsonKey(name: 'DE')
  Country? dE;
  @JsonKey(name: 'EC')
  Country? eC;
  @JsonKey(name: 'FR')
  Country? fR;
  @JsonKey(name: 'GB')
  Country? gB;
  @JsonKey(name: 'GT')
  Country? gT;
  @JsonKey(name: 'HK')
  Country? hK;
  @JsonKey(name: 'HN')
  Country? hN;
  @JsonKey(name: 'ID')
  Country? iD;
  @JsonKey(name: 'IE')
  Country? iE;
  @JsonKey(name: 'IN')
  Country? iN;
  @JsonKey(name: 'KR')
  Country? kR;
  @JsonKey(name: 'MX')
  Country? mX;
  @JsonKey(name: 'MY')
  Country? mY;
  @JsonKey(name: 'NZ')
  Country? nZ;
  @JsonKey(name: 'PE')
  Country? pE;
  @JsonKey(name: 'PH')
  Country? pH;
  @JsonKey(name: 'PL')
  Country? pL;
  @JsonKey(name: 'PY')
  Country? pY;
  @JsonKey(name: 'TH')
  Country? tH;
  @JsonKey(name: 'TW')
  Country? tW;
  @JsonKey(name: 'US')
  Country? uS;
  @JsonKey(name: 'VE')
  Country? vE;

  Country({
    this.aR,
    this.aT,
    this.aU,
    this.bO,
    this.bR,
    this.cA,
    this.cH,
    this.cL,
    this.cO,
    this.cR,
    this.dE,
    this.eC,
    this.fR,
    this.gB,
    this.gT,
    this.hK,
    this.hN,
    this.iD,
    this.iE,
    this.iN,
    this.kR,
    this.mX,
    this.mY,
    this.nZ,
    this.pE,
    this.pH,
    this.pL,
    this.pY,
    this.tH,
    this.tW,
    this.uS,
    this.vE,
  });

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
  Map<String, dynamic> toJson() => _$CountryToJson(this);
}

@JsonSerializable()
class WatchProvider {
  String? link;
  List<Rent>? rent;
  List<Buy>? buy;

  WatchProvider({
    this.link,
    this.rent,
    this.buy,
  });

  factory WatchProvider.fromJson(Map<String, dynamic> json) =>
      _$WatchProviderFromJson(json);
  Map<String, dynamic> toJson() => _$WatchProviderToJson(this);
}

@JsonSerializable()
class Rent {
  @JsonKey(name: 'logo_path')
  String? logoPath;
  @JsonKey(name: 'provider_id')
  int? providerId;
  @JsonKey(name: 'provider_name')
  String? providerName;
  @JsonKey(name: 'display_priority')
  int? displayPriority;

  Rent({
    this.logoPath,
    this.providerId,
    this.providerName,
    this.displayPriority,
  });

  factory Rent.fromJson(Map<String, dynamic> json) => _$RentFromJson(json);
  Map<String, dynamic> toJson() => _$RentToJson(this);
}

@JsonSerializable()
class Buy {
  @JsonKey(name: 'logo_path')
  String? logoPath;
  @JsonKey(name: 'provider_id')
  int? providerId;
  @JsonKey(name: 'provider_name')
  String? providerName;
  @JsonKey(name: 'display_priority')
  int? displayPriority;

  Buy({
    this.logoPath,
    this.providerId,
    this.providerName,
    this.displayPriority,
  });

  factory Buy.fromJson(Map<String, dynamic> json) => _$BuyFromJson(json);
  Map<String, dynamic> toJson() => _$BuyToJson(this);
}
