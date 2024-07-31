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
  WatchProvider? aR;
  @JsonKey(name: 'AT')
  WatchProvider? aT;
  @JsonKey(name: 'AU')
  WatchProvider? aU;
  @JsonKey(name: 'BO')
  WatchProvider? bO;
  @JsonKey(name: 'BR')
  WatchProvider? bR;
  @JsonKey(name: 'CA')
  WatchProvider? cA;
  @JsonKey(name: 'CH')
  WatchProvider? cH;
  @JsonKey(name: 'CL')
  WatchProvider? cL;
  @JsonKey(name: 'CO')
  WatchProvider? cO;
  @JsonKey(name: 'CR')
  WatchProvider? cR;
  @JsonKey(name: 'DE')
  WatchProvider? dE;
  @JsonKey(name: 'EC')
  WatchProvider? eC;
  @JsonKey(name: 'FR')
  WatchProvider? fR;
  @JsonKey(name: 'GB')
  WatchProvider? gB;
  @JsonKey(name: 'GT')
  WatchProvider? gT;
  @JsonKey(name: 'HK')
  WatchProvider? hK;
  @JsonKey(name: 'HN')
  WatchProvider? hN;
  @JsonKey(name: 'ID')
  WatchProvider? iD;
  @JsonKey(name: 'IE')
  WatchProvider? iE;
  @JsonKey(name: 'IN')
  WatchProvider? iN;
  @JsonKey(name: 'KR')
  WatchProvider? kR;
  @JsonKey(name: 'MX')
  WatchProvider? mX;
  @JsonKey(name: 'MY')
  WatchProvider? mY;
  @JsonKey(name: 'NZ')
  WatchProvider? nZ;
  @JsonKey(name: 'PE')
  WatchProvider? pE;
  @JsonKey(name: 'PH')
  WatchProvider? pH;
  @JsonKey(name: 'PL')
  WatchProvider? pL;
  @JsonKey(name: 'PY')
  WatchProvider? pY;
  @JsonKey(name: 'TH')
  WatchProvider? tH;
  @JsonKey(name: 'TW')
  WatchProvider? tW;
  @JsonKey(name: 'US')
  WatchProvider? uS;
  @JsonKey(name: 'VE')
  WatchProvider? vE;

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
