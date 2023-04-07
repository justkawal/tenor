part of tenor;

class TenorGif extends Equatable {
  final GifTypes? preview;
  final GifTypes? gif;
  final GifTypes? mediumgif;
  final GifTypes? tinygif;
  final GifTypes? nanogif;
  final GifTypes? mp4;
  final GifTypes? loopedmp4;
  final GifTypes? tinymp4;
  final GifTypes? nanomp4;
  final GifTypes? webm;
  final GifTypes? tinywebm;
  final GifTypes? nanowebm;
  final GifTypes? webp_transparent;
  final GifTypes? tinywebp_transparent;
  final GifTypes? nanowebp_transparent;
  final GifTypes? gif_transparent;
  final GifTypes? tinygif_transparent;
  final GifTypes? nanogif_transparent;

  const TenorGif({
    this.preview,
    this.gif,
    this.mediumgif,
    this.tinygif,
    this.nanogif,
    this.mp4,
    this.loopedmp4,
    this.tinymp4,
    this.nanomp4,
    this.webm,
    this.tinywebm,
    this.nanowebm,
    this.webp_transparent,
    this.tinywebp_transparent,
    this.nanowebp_transparent,
    this.gif_transparent,
    this.tinygif_transparent,
    this.nanogif_transparent,
  });

  Map<String, dynamic> toMap() {
    return {
      'preview': preview?.toMap(),
      'gif': gif?.toMap(),
      'mediumgif': mediumgif?.toMap(),
      'tinygif': tinygif?.toMap(),
      'nanogif': nanogif?.toMap(),
      'mp4': mp4?.toMap(),
      'loopedmp4': loopedmp4?.toMap(),
      'tinymp4': tinymp4?.toMap(),
      'nanomp4': nanomp4?.toMap(),
      'webm': webm?.toMap(),
      'tinywebm': tinywebm?.toMap(),
      'nanowebm': nanowebm?.toMap(),
      'webp_transparent': webp_transparent?.toMap(),
      'tinywebp_transparent': tinywebp_transparent?.toMap(),
      'nanowebp_transparent': nanowebp_transparent?.toMap(),
      'gif_transparent': gif_transparent?.toMap(),
      'tinygif_transparent': tinygif_transparent?.toMap(),
      'nanogif_transparent': nanogif_transparent?.toMap(),
    };
  }

  static TenorGif fromMap(Map<String, dynamic> map) {
    return TenorGif(
      preview: GifTypes.fromMap(map['preview']),
      gif: GifTypes.fromMap(map['gif']),
      mediumgif: GifTypes.fromMap(map['mediumgif']),
      tinygif: GifTypes.fromMap(map['tinygif']),
      nanogif: GifTypes.fromMap(map['nanogif']),
      mp4: GifTypes.fromMap(map['mp4']),
      loopedmp4: GifTypes.fromMap(map['loopedmp4']),
      tinymp4: GifTypes.fromMap(map['tinymp4']),
      nanomp4: GifTypes.fromMap(map['nanomp4']),
      webm: GifTypes.fromMap(map['webm']),
      tinywebm: GifTypes.fromMap(map['tinywebm']),
      nanowebm: GifTypes.fromMap(map['nanowebm']),
      webp_transparent: GifTypes.fromMap(map['webp_transparent']),
      tinywebp_transparent: GifTypes.fromMap(map['tinywebp_transparent']),
      nanowebp_transparent: GifTypes.fromMap(map['nanowebp_transparent']),
      gif_transparent: GifTypes.fromMap(map['gif_transparent']),
      tinygif_transparent: GifTypes.fromMap(map['tinygif_transparent']),
      nanogif_transparent: GifTypes.fromMap(map['nanogif_transparent']),
    );
  }

  String toJson() => json.encode(toMap());

  static TenorGif fromJson(String source) =>
      TenorGif.fromMap(json.decode(source));

  @override
  String toString() {
    return '''TenorGif(preview: $preview, gif: $gif, mediumgif: $mediumgif, tinygif: $tinygif, nanogif: $nanogif, mp4: $mp4, loopedmp4: $loopedmp4, tinymp4: $tinymp4, nanomp4: $nanomp4, webm: $webm, tinywebm: $tinywebm, nanowebm: $nanowebm, webp_transparent: $webp_transparent, tinywebp_transparent: $tinywebp_transparent, nanowebp_transparent: $nanowebp_transparent, gif_transparent: $gif_transparent, tinygif_transparent: $tinygif_transparent, nanogif_transparent: $nanogif_transparent)''';
  }

  @override
  List<Object?> get props => [
        preview,
        gif,
        mediumgif,
        tinygif,
        nanogif,
        mp4,
        loopedmp4,
        tinymp4,
        nanomp4,
        webm,
        tinywebm,
        nanowebm,
        webp_transparent,
        tinywebp_transparent,
        nanowebp_transparent,
        gif_transparent,
        tinygif_transparent,
        nanogif_transparent
      ];
}
