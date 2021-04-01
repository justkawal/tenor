part of tenor;

// ignore: must_be_immutable
class GifTypes extends Equatable {
  String url;
  String previewUrl;
  int size;
  List<int> dims;
  double duration;
  GifTypes({
    this.url,
    this.previewUrl,
    this.size,
    this.dims,
    this.duration,
  });

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'preview': previewUrl,
      'size': size,
      'dims': dims,
      'duration': duration,
    };
  }

  static GifTypes fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return GifTypes(
      url: map['url'],
      previewUrl: map['preview'],
      size: map['size'],
      dims: List<int>.from(map['dims'] ?? <int>[]),
      duration: (map['duration'] ?? .0) + .0,
    );
  }

  String toJson() => json.encode(toMap());

  static GifTypes fromJson(String source) =>
      GifTypes.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GifTypes(url: $url, previewUrl: $previewUrl, size: $size, dims: $dims, duration: $duration)';
  }

  @override
  List<Object> get props => [url, previewUrl, size, dims, duration];
}
