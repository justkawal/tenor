part of tenor;

// ignore: must_be_immutable
class TenorResponse extends Equatable {
  final List<TenorResult> results;
  final String? next;
  final String? keys;
  final EndPoint? endpoint;
  const TenorResponse({
    required this.results,
    this.next,
    this.endpoint,
    this.keys,
  });

  Map<String, dynamic> toMap() {
    return {
      'results': results.map((x) => x.toMap()).toList(),
      'next': next,
    };
  }

  static TenorResponse fromMap(
    Map<String, dynamic> map, {
    EndPoint? endPoint,
    String? keys,
  }) {
    return TenorResponse(
      results: List<TenorResult>.from(
          map['results']?.map((x) => TenorResult.fromMap(x, keys: keys)) ??
              <TenorResult>[]),
      next: map['next'],
      endpoint: endPoint,
      keys: keys,
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

  static TenorResponse fromJson(String source, {String? keys}) =>
      TenorResponse.fromMap(json.decode(source), keys: keys);

  @override
  List<Object?> get props => [results];
}
