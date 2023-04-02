part of tenor;

// ignore: must_be_immutable
class TenorGif extends Equatable {
  final GifTypes? nanomp4;
  final GifTypes? tinygif;
  final GifTypes? tinymp4;
  final GifTypes? gif;
  final GifTypes? mp4;
  final GifTypes? nanogif;
  const TenorGif({
    this.nanomp4,
    this.tinygif,
    this.tinymp4,
    this.gif,
    this.mp4,
    this.nanogif,
  });

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

  static TenorGif fromMap(Map<String, dynamic> map) {
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

  static TenorGif fromJson(String source) =>
      TenorGif.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TenorGif(nanomp4: $nanomp4, tinygif: $tinygif, tinymp4: $tinymp4, gif: $gif, mp4: $mp4, nanogif: $nanogif)';
  }

  @override
  List<Object?> get props => [nanomp4, tinygif, tinymp4, gif, mp4, nanogif];
}
