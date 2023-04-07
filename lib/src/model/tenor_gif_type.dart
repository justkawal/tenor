part of tenor;

// ignore: must_be_immutable
class GifTypes extends Equatable {
  /// A URL to the media source
  final String url;

  /// Size of the file in bytes
  final List<int> dims;

  /// Represents the time in seconds for one loop of the content. If the content is static, the duration is set to 0.
  final double duration;

  /// Size of the file in bytes
  final int size;
  const GifTypes({
    required this.url,
    required this.dims,
    required this.duration,
    required this.size,
  });

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'dims': dims,
      'duration': duration,
      'size': size,
    };
  }

  static GifTypes? fromMap(Map<String, dynamic>? map) {
    if (map == null) return null;
    return GifTypes(
      url: map['url'],
      dims: List<int>.from(map['dims'] ?? <int>[], growable: false),
      duration: map['duration'] + .0,
      size: map['size'],
    );
  }

  String toJson() => json.encode(toMap());

  static GifTypes? fromJson(String source) =>
      GifTypes.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GifTypes(url: $url, size: $size, dims: $dims, duration: $duration)';
  }

  @override
  List<Object?> get props => [url, size, dims, duration];
}
