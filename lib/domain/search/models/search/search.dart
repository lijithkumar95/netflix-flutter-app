import 'package:json_annotation/json_annotation.dart';
import 'package:netflix/core/constants.dart';

part 'search.g.dart';

@JsonSerializable()
class Search {
  @JsonKey(name: 'results')
  List<SearchResultData> results;
  Search({
    this.results = const [],
  });

  factory Search.fromJson(Map<String, dynamic> json) {
    return _$SearchFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchToJson(this);
}

@JsonSerializable()
class SearchResultData {
  @JsonKey(name: 'original_title')
  String? originalTitle;
  @JsonKey(name: 'poster_path')
  String? posterPath;

  String get posterPathImageUrl => '$imageAppendUrl$posterPath';

  SearchResultData({
    this.originalTitle,
    this.posterPath,
  });

  factory SearchResultData.fromJson(Map<String, dynamic> json) {
    return _$SearchResultDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchResultDataToJson(this);
}
