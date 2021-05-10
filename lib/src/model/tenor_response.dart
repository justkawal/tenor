part of tenor;

// ignore: must_be_immutable
class TenorResponse extends Equatable {
  List<TenorResult> results;
  String? next;
  ContentFilter contentFilter;
  String? keys;
  MediaFilter mediaFilter;
  EndPoint? endpoint;
  TenorResponse({
    required this.results,
    this.next,
    this.endpoint,
    this.keys,
    this.contentFilter = ContentFilter.high,
    this.mediaFilter = MediaFilter.basic,
  });

  Map<String, dynamic> toMap() {
    return {
      'results': results.map((x) => x.toMap()).toList(),
      'next': next,
      'contentFilter': contentFilter.toString().enumVal,
      'mediaFilter': mediaFilter.toString().enumVal,
    };
  }

  static TenorResponse? fromMap(
    Map<String, dynamic>? map, {
    bool canShare = false,
    EndPoint? endPoint,
    String? keys,
  }) {
    if (map == null) return null;
    return TenorResponse(
      results: List<TenorResult>.from(map['results']?.map(
              (x) => TenorResult.fromMap(x, canShare: canShare, keys: keys)) ??
          <TenorResult>[]),
      next: map['next'],
      endpoint: endPoint,
      keys: keys,
      contentFilter: map['contentFilter'] ?? ContentFilter.high,
      mediaFilter: map['mediaFilter'] ?? MediaFilter.basic,
    );
  }

  Future<TenorResponse?> fetchNext({int limit = 1}) {
    return _privateRequestGif(
      /// this is done on purpose and has no effect, as I'am eventually ignoring it with helperUrl in the calling function
      endpoint!,

      /// keys are also emptied on purpose as it will not have any effect
      keys!,
      limit: limit,
      contentFilter: null, // this is done on purpose
      size: null, // this is done on purpose
      mediaFilter: null, // this is done on purpose
      pos: next,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'TenorResponse(results: $results, next: $next)';

  static TenorResponse? fromJson(String source,
          {bool canShare = false, String? keys}) =>
      TenorResponse.fromMap(json.decode(source),
          canShare: canShare, keys: keys);

  @override
  List<Object?> get props => [results];
}
