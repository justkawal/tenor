part of tenor;

class TenorResult {
  bool hasCaption;
  bool hasaudio;
  int shares;
  String id;
  String title;
  String created;
  String url;
  String itemurl;
  TenorGif media;
  TenorResult({
    this.hasCaption,
    this.hasaudio,
    this.shares,
    this.id,
    this.title,
    this.created,
    this.url,
    this.itemurl,
    this.media,
  });

  TenorResult copyWith({
    bool hasCaption,
    bool hasaudio,
    int shares,
    String id,
    String title,
    String created,
    String url,
    String itemurl,
    TenorGif media,
  }) {
    return TenorResult(
      hasCaption: hasCaption ?? this.hasCaption,
      hasaudio: hasaudio ?? this.hasaudio,
      shares: shares ?? this.shares,
      id: id ?? this.id,
      title: title ?? this.title,
      created: created ?? this.created,
      url: url ?? this.url,
      itemurl: itemurl ?? this.itemurl,
      media: media ?? this.media,
    );
  }

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

  factory TenorResult.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return TenorResult(
      hasCaption: map['hascaption'],
      hasaudio: map['hasaudio'],
      shares: map['shares'],
      id: map['id'],
      title: map['title'],
      created: '${map['created']}',
      url: map['url'],
      itemurl: map['itemurl'],
      media: TenorGif.fromMap((map != null &&
              map['media'] != null &&
              (map['media'] is List && map['media'].length != 0))
          ? map['media'][0]
          : <String, dynamic>{}),
    );
  }

  String toJson() => json.encode(toMap());

  factory TenorResult.fromJson(String source) =>
      TenorResult.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TenorResult(hasCaption: $hasCaption, hasaudio: $hasaudio, shares: $shares, id: $id, title: $title, created: $created, url: $url, itemurl: $itemurl, media: $media)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is TenorResult &&
        o.hasCaption == hasCaption &&
        o.hasaudio == hasaudio &&
        o.shares == shares &&
        o.id == id &&
        o.title == title &&
        o.created == created &&
        o.url == url &&
        o.itemurl == itemurl &&
        o.media == media;
  }

  @override
  int get hashCode {
    return hasCaption.hashCode ^
        hasaudio.hashCode ^
        shares.hashCode ^
        id.hashCode ^
        title.hashCode ^
        created.hashCode ^
        url.hashCode ^
        itemurl.hashCode ^
        media.hashCode;
  }
}
