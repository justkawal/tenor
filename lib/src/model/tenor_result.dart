part of tenor;

// ignore: must_be_immutable
class TenorResult extends Equatable {
  bool hasCaption = false;
  bool hasaudio = false;
  int shares;
  String? id;
  String? title;
  String? created;
  String? url;
  String? itemurl;
  TenorGif? media;
  TenorResult({
    this.hasCaption = false,
    this.hasaudio = false,
    this.shares = 0,
    this.id,
    this.title,
    this.created,
    this.url,
    this.itemurl,
    this.media,
  });

  Map<String, dynamic> toMap() {
    return {
      'hasCaption': hasCaption,
      'hasaudio': hasaudio,
      'shares': shares,
      'id': id,
      'title': title,
      'created': created,
      'url': url,
      'itemurl': itemurl,
      'media': media?.toMap(),
    };
  }

  static TenorResult? fromMap(Map<String, dynamic>? map) {
    if (map == null) return null;
    return TenorResult(
      hasCaption: map['hascaption'] ?? false,
      hasaudio: map['hasaudio'] ?? false,
      shares: map['shares'] ?? 0,
      id: map['id'],
      title: map['title'],
      created: '${map['created']}',
      url: map['url'],
      itemurl: map['itemurl'],
      media: TenorGif.fromMap((map['media'] != null &&
              (map['media'] is List && map['media'].length != 0))
          ? map['media'][0]
          : <String, dynamic>{}),
    );
  }

  String toJson() => json.encode(toMap());

  static TenorResult? fromJson(String source) =>
      TenorResult.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TenorResult(hasCaption: $hasCaption, hasaudio: $hasaudio, shares: $shares, id: $id, title: $title, created: $created, url: $url, itemurl: $itemurl, media: $media)';
  }

  @override
  List<Object?> get props =>
      [hasCaption, hasaudio, shares, id, title, created, url, itemurl, media];
}
