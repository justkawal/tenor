part of tenor;

class TenorGif {
  GifTypes nanomp4, tinygif, tinymp4, gif, mp4, nanogif;
  TenorGif({
    this.nanomp4,
    this.tinygif,
    this.tinymp4,
    this.gif,
    this.mp4,
    this.nanogif,
  });

  TenorGif copyWith({
    GifTypes nanomp4,
    GifTypes tinygif,
    GifTypes tinymp4,
    GifTypes gif,
    GifTypes mp4,
    GifTypes nanogif,
  }) {
    return TenorGif(
      nanomp4: nanomp4 ?? this.nanomp4,
      tinygif: tinygif ?? this.tinygif,
      tinymp4: tinymp4 ?? this.tinymp4,
      gif: gif ?? this.gif,
      mp4: mp4 ?? this.mp4,
      nanogif: nanogif ?? this.nanogif,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nanomp4': nanomp4?.toMap(),
      'tinygif': tinygif?.toMap(),
      'tinymp4': tinymp4?.toMap(),
      'gif': gif?.toMap(),
      'mp4': mp4?.toMap(),
      'nanogif': nanogif?.toMap(),
    };
  }

  factory TenorGif.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return TenorGif(
      nanomp4: GifTypes.fromMap(map['nanomp4']),
      tinygif: GifTypes.fromMap(map['tinygif']),
      tinymp4: GifTypes.fromMap(map['tinymp4']),
      gif: GifTypes.fromMap(map['gif']),
      mp4: GifTypes.fromMap(map['mp4']),
      nanogif: GifTypes.fromMap(map['nanogif']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TenorGif.fromJson(String source) =>
      TenorGif.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TenorGif(nanomp4: $nanomp4, tinygif: $tinygif, tinymp4: $tinymp4, gif: $gif, mp4: $mp4, nanogif: $nanogif)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is TenorGif &&
        o.nanomp4 == nanomp4 &&
        o.tinygif == tinygif &&
        o.tinymp4 == tinymp4 &&
        o.gif == gif &&
        o.mp4 == mp4 &&
        o.nanogif == nanogif;
  }

  @override
  int get hashCode {
    return nanomp4.hashCode ^
        tinygif.hashCode ^
        tinymp4.hashCode ^
        gif.hashCode ^
        mp4.hashCode ^
        nanogif.hashCode;
  }
}
