part of tenor;

// ignore: must_be_immutable
class TenorResponse extends Equatable {
  final List<TenorResult> results;
  final String? next;
  final ContentFilter contentFilter;
  final SearchFilter searchFilter;
  final String? keys;
  final List<MediaFilter> mediaFilter;
  final EndPoint? endpoint;
  const TenorResponse({
    required this.results,
    this.next,
    this.endpoint,
    this.searchFilter = SearchFilter.gif,
    this.keys,
    this.contentFilter = ContentFilter.high,
    this.mediaFilter = MediaFilter.values,
  });

  Map<String, dynamic> toMap() {
    return {
      'results': results.map((x) => x.toMap()).toList(),
      'next': next,
      'contentFilter': contentFilter.name,
      'mediaFilter': mediaFilter.map((x) => x.name).toList(),
      'searchFilter': searchFilter.name,
    };
  }

  static TenorResponse fromMap(
    Map<String, dynamic> map, {
    bool canShare = false,
    EndPoint? endPoint,
    String? keys,
  }) {
    final mediaFilter = <MediaFilter>[];

    if (map['mediaFilter'] != null) {
      final mediaFilterList = MediaFilter.values.map((e) => e.name).toList();

      for (final String filter in map['mediaFilter']) {
        final mediaFilterIndex = mediaFilterList.indexOf(filter);
        if (mediaFilterIndex != -1) {
          mediaFilter.add(MediaFilter.values[mediaFilterIndex]);
        }
      }
    }
    return TenorResponse(
      results: List<TenorResult>.from(map['results']?.map(
              (x) => TenorResult.fromMap(x, canShare: canShare, keys: keys)) ??
          <TenorResult>[]),
      next: map['next'],
      endpoint: endPoint,
      keys: keys,
      searchFilter: map['searchFilter'] ?? SearchFilter.gif,
      contentFilter: map['contentFilter'] ?? ContentFilter.high,
      mediaFilter: mediaFilter,
    );
  }

  Future<TenorResponse?> fetchNext({int limit = 1}) {
    return _privateRequestGif(
      /// this is done on purpose and has no effect, as I'am eventually ignoring it with helperUrl in the calling function
      endpoint!,

      /// keys are also emptied on purpose as it will not have any effect
      keys!,
      limit: limit,
      searchFilter: null, // this is done on purpose
      contentFilter: null, // this is done on purpose
      size: null, // this is done on purpose
      mediaFilter: null, // this is done on purpose
      pos: next,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'TenorResponse(results: $results, next: $next)';

  static TenorResponse fromJson(String source,
          {bool canShare = false, String? keys}) =>
      TenorResponse.fromMap(json.decode(source),
          canShare: canShare, keys: keys);

  @override
  List<Object?> get props => [results];
}
