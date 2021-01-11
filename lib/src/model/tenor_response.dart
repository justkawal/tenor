part of tenor;

class TenorResponse {
  List<TenorResult> results;
  String next;
  final String url;
  String contentFilter = ContentFilter.high;
  String mediaFilter = MediaFilter.basic;
  TenorResponse({
    this.results,
    this.next,
    this.url,
    this.contentFilter,
    this.mediaFilter,
  });

  Map<String, dynamic> toMap() {
    return {
      'results': results?.map((x) => x?.toMap())?.toList(),
      'next': next,
      'contentFilter': ContentFilter._findVal(contentFilter),
      'mediaFilter': MediaFilter._findVal(mediaFilter),
    };
  }

  factory TenorResponse.fromMap(Map<String, dynamic> map, {String urlNew}) {
    if (map == null) return null;

    return TenorResponse(
      results: List<TenorResult>.from(
          map['results']?.map((x) => TenorResult.fromMap(x))),
      next: map['next'],
      url: urlNew,
      contentFilter: ContentFilter._findVal(map['contentFilter']),
      mediaFilter: MediaFilter._findVal(map['mediaFilter']),
    );
  }

  Future<TenorResponse> fetchNext({int limit = 1}) {
    return _privateRequestGif(
      url,
      limit: limit,
      contentFilter: null, // this is done on purpose
      mediaFilter: null, // this is done on purpose
      pos: next,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'TenorResponse(results: $results, next: $next)';

  factory TenorResponse.fromJson(String source) =>
      TenorResponse.fromMap(json.decode(source));

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return o is TenorResponse &&
        listEquals(o.results, results) &&
        o.next == next;
  }

  @override
  int get hashCode => results.hashCode ^ next.hashCode;
}
