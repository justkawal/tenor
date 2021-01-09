part of tenor;

class TenorResponse {
  List<TenorResult> results;
  String next;
  TenorResponse({
    this.results,
    this.next,
  });

  TenorResponse copyWith({
    List<TenorResult> results,
    String next,
  }) {
    return TenorResponse(
      results: results ?? this.results,
      next: next ?? this.next,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'results': results?.map((x) => x?.toMap())?.toList(),
      'next': next,
    };
  }

  factory TenorResponse.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return TenorResponse(
      results: List<TenorResult>.from(
          map['results']?.map((x) => TenorResult.fromMap(x))),
      next: map['next'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TenorResponse.fromJson(String source) =>
      TenorResponse.fromMap(json.decode(source));

  @override
  String toString() => 'TenorResponse(results: $results, next: $next)';

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
