// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_watch_providers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieWatchProvidersModel _$MovieWatchProvidersModelFromJson(
        Map<String, dynamic> json) =>
    MovieWatchProvidersModel(
      id: (json['id'] as num?)?.toInt(),
      results: (json['results'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k, RegionWatchProvider.fromJson(e as Map<String, dynamic>)),
      ),
    );

RegionWatchProvider _$RegionWatchProviderFromJson(Map<String, dynamic> json) =>
    RegionWatchProvider(
      link: json['link'] as String?,
      buy: (json['buy'] as List<dynamic>?)
          ?.map((e) => Provider.fromJson(e as Map<String, dynamic>))
          .toList(),
      rent: (json['rent'] as List<dynamic>?)
          ?.map((e) => Provider.fromJson(e as Map<String, dynamic>))
          .toList(),
      flatrate: (json['flatrate'] as List<dynamic>?)
          ?.map((e) => Provider.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Provider _$ProviderFromJson(Map<String, dynamic> json) => Provider(
      logoPath: json['logoPath'] as String?,
      providerId: (json['providerId'] as num?)?.toInt(),
      providerName: json['providerName'] as String?,
      displayPriority: (json['displayPriority'] as num?)?.toInt(),
    );
