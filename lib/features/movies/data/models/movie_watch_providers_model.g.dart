// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_watch_providers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieWatchProviderModel _$MovieWatchProviderModelFromJson(
        Map<String, dynamic> json) =>
    MovieWatchProviderModel(
      id: (json['id'] as num?)?.toInt(),
      country: json['results'] == null
          ? null
          : Country.fromJson(json['results'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MovieWatchProviderModelToJson(
        MovieWatchProviderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'results': instance.country,
    };

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      aR: json['AR'] == null
          ? null
          : Country.fromJson(json['AR'] as Map<String, dynamic>),
      aT: json['AT'] == null
          ? null
          : Country.fromJson(json['AT'] as Map<String, dynamic>),
      aU: json['AU'] == null
          ? null
          : Country.fromJson(json['AU'] as Map<String, dynamic>),
      bO: json['BO'] == null
          ? null
          : Country.fromJson(json['BO'] as Map<String, dynamic>),
      bR: json['BR'] == null
          ? null
          : Country.fromJson(json['BR'] as Map<String, dynamic>),
      cA: json['CA'] == null
          ? null
          : Country.fromJson(json['CA'] as Map<String, dynamic>),
      cH: json['CH'] == null
          ? null
          : Country.fromJson(json['CH'] as Map<String, dynamic>),
      cL: json['CL'] == null
          ? null
          : Country.fromJson(json['CL'] as Map<String, dynamic>),
      cO: json['CO'] == null
          ? null
          : Country.fromJson(json['CO'] as Map<String, dynamic>),
      cR: json['CR'] == null
          ? null
          : Country.fromJson(json['CR'] as Map<String, dynamic>),
      dE: json['DE'] == null
          ? null
          : Country.fromJson(json['DE'] as Map<String, dynamic>),
      eC: json['EC'] == null
          ? null
          : Country.fromJson(json['EC'] as Map<String, dynamic>),
      fR: json['FR'] == null
          ? null
          : Country.fromJson(json['FR'] as Map<String, dynamic>),
      gB: json['GB'] == null
          ? null
          : Country.fromJson(json['GB'] as Map<String, dynamic>),
      gT: json['GT'] == null
          ? null
          : Country.fromJson(json['GT'] as Map<String, dynamic>),
      hK: json['HK'] == null
          ? null
          : Country.fromJson(json['HK'] as Map<String, dynamic>),
      hN: json['HN'] == null
          ? null
          : Country.fromJson(json['HN'] as Map<String, dynamic>),
      iD: json['ID'] == null
          ? null
          : Country.fromJson(json['ID'] as Map<String, dynamic>),
      iE: json['IE'] == null
          ? null
          : Country.fromJson(json['IE'] as Map<String, dynamic>),
      iN: json['IN'] == null
          ? null
          : Country.fromJson(json['IN'] as Map<String, dynamic>),
      kR: json['KR'] == null
          ? null
          : Country.fromJson(json['KR'] as Map<String, dynamic>),
      mX: json['MX'] == null
          ? null
          : Country.fromJson(json['MX'] as Map<String, dynamic>),
      mY: json['MY'] == null
          ? null
          : Country.fromJson(json['MY'] as Map<String, dynamic>),
      nZ: json['NZ'] == null
          ? null
          : Country.fromJson(json['NZ'] as Map<String, dynamic>),
      pE: json['PE'] == null
          ? null
          : Country.fromJson(json['PE'] as Map<String, dynamic>),
      pH: json['PH'] == null
          ? null
          : Country.fromJson(json['PH'] as Map<String, dynamic>),
      pL: json['PL'] == null
          ? null
          : Country.fromJson(json['PL'] as Map<String, dynamic>),
      pY: json['PY'] == null
          ? null
          : Country.fromJson(json['PY'] as Map<String, dynamic>),
      tH: json['TH'] == null
          ? null
          : Country.fromJson(json['TH'] as Map<String, dynamic>),
      tW: json['TW'] == null
          ? null
          : Country.fromJson(json['TW'] as Map<String, dynamic>),
      uS: json['US'] == null
          ? null
          : Country.fromJson(json['US'] as Map<String, dynamic>),
      vE: json['VE'] == null
          ? null
          : Country.fromJson(json['VE'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'AR': instance.aR,
      'AT': instance.aT,
      'AU': instance.aU,
      'BO': instance.bO,
      'BR': instance.bR,
      'CA': instance.cA,
      'CH': instance.cH,
      'CL': instance.cL,
      'CO': instance.cO,
      'CR': instance.cR,
      'DE': instance.dE,
      'EC': instance.eC,
      'FR': instance.fR,
      'GB': instance.gB,
      'GT': instance.gT,
      'HK': instance.hK,
      'HN': instance.hN,
      'ID': instance.iD,
      'IE': instance.iE,
      'IN': instance.iN,
      'KR': instance.kR,
      'MX': instance.mX,
      'MY': instance.mY,
      'NZ': instance.nZ,
      'PE': instance.pE,
      'PH': instance.pH,
      'PL': instance.pL,
      'PY': instance.pY,
      'TH': instance.tH,
      'TW': instance.tW,
      'US': instance.uS,
      'VE': instance.vE,
    };

WatchProvider _$WatchProviderFromJson(Map<String, dynamic> json) =>
    WatchProvider(
      link: json['link'] as String?,
      rent: (json['rent'] as List<dynamic>?)
          ?.map((e) => Rent.fromJson(e as Map<String, dynamic>))
          .toList(),
      buy: (json['buy'] as List<dynamic>?)
          ?.map((e) => Buy.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WatchProviderToJson(WatchProvider instance) =>
    <String, dynamic>{
      'link': instance.link,
      'rent': instance.rent,
      'buy': instance.buy,
    };

Rent _$RentFromJson(Map<String, dynamic> json) => Rent(
      logoPath: json['logo_path'] as String?,
      providerId: (json['provider_id'] as num?)?.toInt(),
      providerName: json['provider_name'] as String?,
      displayPriority: (json['display_priority'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RentToJson(Rent instance) => <String, dynamic>{
      'logo_path': instance.logoPath,
      'provider_id': instance.providerId,
      'provider_name': instance.providerName,
      'display_priority': instance.displayPriority,
    };

Buy _$BuyFromJson(Map<String, dynamic> json) => Buy(
      logoPath: json['logo_path'] as String?,
      providerId: (json['provider_id'] as num?)?.toInt(),
      providerName: json['provider_name'] as String?,
      displayPriority: (json['display_priority'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BuyToJson(Buy instance) => <String, dynamic>{
      'logo_path': instance.logoPath,
      'provider_id': instance.providerId,
      'provider_name': instance.providerName,
      'display_priority': instance.displayPriority,
    };
