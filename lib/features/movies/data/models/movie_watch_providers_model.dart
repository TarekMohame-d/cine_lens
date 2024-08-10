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

  // Method to convert Country to List of WatchProvider
  List<(WatchProvider, String)> toWatchProviderList() {
    List<(WatchProvider, String)> providers = [];
    if (aR != null && aR?.rent != null) providers.add((aR!, 'AR'));
    if (aT != null && aT?.rent != null) providers.add((aT!, 'AT'));
    if (aU != null && aU?.rent != null) providers.add((aU!, 'AU'));
    if (bO != null && bO?.rent != null) providers.add((bO!, 'BO'));
    if (bR != null && bR?.rent != null) providers.add((bR!, 'BR'));
    if (cA != null && cA?.rent != null) providers.add((cA!, 'CA'));
    if (cH != null && cH?.rent != null) providers.add((cH!, 'CH'));
    if (cL != null && cL?.rent != null) providers.add((cL!, 'CL'));
    if (cO != null && cO?.rent != null) providers.add((cO!, 'CO'));
    if (cR != null && cR?.rent != null) providers.add((cR!, 'CR'));
    if (dE != null && dE?.rent != null) providers.add((dE!, 'DE'));
    if (eC != null && eC?.rent != null) providers.add((eC!, 'EC'));
    if (fR != null && fR?.rent != null) providers.add((fR!, 'FR'));
    if (gB != null && gB?.rent != null) providers.add((gB!, 'GB'));
    if (gT != null && gT?.rent != null) providers.add((gT!, 'GT'));
    if (hK != null && hK?.rent != null) providers.add((hK!, 'HK'));
    if (hN != null && hN?.rent != null) providers.add((hN!, 'HN'));
    if (iD != null && iD?.rent != null) providers.add((iD!, 'ID'));
    if (iE != null && iE?.rent != null) providers.add((iE!, 'IE'));
    if (iN != null && iN?.rent != null) providers.add((iN!, 'IN'));
    if (kR != null && kR?.rent != null) providers.add((kR!, 'KR'));
    if (mX != null && mX?.rent != null) providers.add((mX!, 'MX'));
    if (mY != null && mY?.rent != null) providers.add((mY!, 'MY'));
    if (nZ != null && nZ?.rent != null) providers.add((nZ!, 'NZ'));
    if (pE != null && pE?.rent != null) providers.add((pE!, 'PE'));
    if (pH != null && pH?.rent != null) providers.add((pH!, 'PH'));
    if (pL != null && pL?.rent != null) providers.add((pL!, 'PL'));
    if (pY != null && pY?.rent != null) providers.add((pY!, 'PY'));
    if (tH != null && tH?.rent != null) providers.add((tH!, 'TH'));
    if (tW != null && tW?.rent != null) providers.add((tW!, 'TW'));
    if (uS != null && uS?.rent != null) providers.add((uS!, 'US'));
    if (vE != null && vE?.rent != null) providers.add((vE!, 'VE'));
    return providers;
  }
}

@JsonSerializable()
class WatchProvider {
  String? link;
  List<Rent>? rent;

  WatchProvider({
    this.link,
    this.rent,
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
