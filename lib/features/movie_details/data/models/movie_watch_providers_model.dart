import 'package:json_annotation/json_annotation.dart';

part 'movie_watch_providers_model.g.dart';

@JsonSerializable(createToJson: false)
class MovieWatchProvidersModel {
  final int? id;
  @JsonKey(name: 'results')
  final Map<String, RegionWatchProvider>? results;

  MovieWatchProvidersModel({
    this.id,
    this.results,
  });

  factory MovieWatchProvidersModel.fromJson(Map<String, dynamic> json) =>
      _$MovieWatchProvidersModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class RegionWatchProvider {
  final String? link;
  final List<Provider>? buy;
  final List<Provider>? rent;
  final List<Provider>? flatrate;

  RegionWatchProvider({
    this.link,
    this.buy,
    this.rent,
    this.flatrate,
  });

  factory RegionWatchProvider.fromJson(Map<String, dynamic> json) =>
      _$RegionWatchProviderFromJson(json);
}

@JsonSerializable(createToJson: false)
class Provider {
  final String? logoPath;
  final int? providerId;
  final String? providerName;
  final int? displayPriority;

  Provider({
    this.logoPath,
    this.providerId,
    this.providerName,
    this.displayPriority,
  });

  factory Provider.fromJson(Map<String, dynamic> json) =>
      _$ProviderFromJson(json);
}
