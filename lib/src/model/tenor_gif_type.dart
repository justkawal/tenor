part of tenor;

class GifTypes {
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

  GifTypes copyWith({
    String url,
    String previewUrl,
    int size,
    List<int> dims,
    double duration,
  }) {
    return GifTypes(
      url: url ?? this.url,
      previewUrl: previewUrl ?? this.previewUrl,
      size: size ?? this.size,
      dims: dims ?? this.dims,
      duration: duration ?? this.duration,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'preview': previewUrl,
      'size': size,
      'dims': dims,
      'duration': duration,
    };
  }

  factory GifTypes.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return GifTypes(
      url: map['url'],
      previewUrl: map['preview'],
      size: map['size'],
      dims: List<int>.from(map['dims']),
      duration: map['duration'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GifTypes.fromJson(String source) =>
      GifTypes.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GifTypes(url: $url, previewUrl: $previewUrl, size: $size, dims: $dims, duration: $duration)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return o is GifTypes &&
        o.url == url &&
        o.previewUrl == previewUrl &&
        o.size == size &&
        listEquals(o.dims, dims) &&
        o.duration == duration;
  }

  @override
  int get hashCode {
    return url.hashCode ^
        previewUrl.hashCode ^
        size.hashCode ^
        dims.hashCode ^
        duration.hashCode;
  }
}
