part of tenor;

// ignore: must_be_immutable
class TenorResult extends Equatable {
  bool hasCaption = false;
  bool hasaudio = false;
  bool canShare = false;
  int shares;
  String? id;
  String? keys;
  String? title;
  String? created;
  String? url;
  String? itemurl;
  TenorGif? media;
  TenorResult({
    this.canShare = false,
    this.created,
    this.hasaudio = false,
    this.hasCaption = false,
    this.id,
    this.keys,
    this.itemurl,
    this.media,
    this.shares = 0,
    this.title,
    this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'canShare': canShare,
      'created': created,
      'hasaudio': hasaudio,
      'hasCaption': hasCaption,
      'id': id,
      'itemurl': itemurl,
      'media': media?.toMap(),
      'shares': shares,
      'title': title,
      'url': url,
    };
  }

  static TenorResult? fromMap(Map<String, dynamic>? map,
      {bool canShare = false, String? keys}) {
    if (map == null) return null;
    return TenorResult(
      hasCaption: map['hascaption'] ?? false,
      hasaudio: map['hasaudio'] ?? false,
      shares: map['shares'] ?? 0,
      id: map['id'],
      keys: keys,
      title: map['title'],
      created: '${map['created']}',
      url: map['url'],
      itemurl: map['itemurl'],
      canShare: canShare,
      media: TenorGif.fromMap((map['media'] != null &&
              (map['media'] is List && map['media'].length != 0))
          ? map['media'][0]
          : <String, dynamic>{}),
    );
  }

  /// This helps further tune Tenor’s Search Engine AI, helping users more easily find the perfect GIF.
  ///
  /// As Tenor’s service evolves, it will be used to better tune search results to your users’ specific languages, cultures, and social trends.
  ///
  /// Note: To use `registerShare` It is important pass the `anon_id` and `language_key` on the tenor api initialization.
  ///
  ///
  /// For more info head to: https://tenor.com/gifapi/documentation#endpoints-registershare
  /// ```dart
  /// String userId = 'Unique id for each user to personalize their experience on tenor.';
  /// Tenor tenor = Tenor(apiKey: 'ApiKey', language: TenorLanguage.English);
  ///
  /// TenorResult tenorResultObject = ............;
  ///
  /// String? isRegistered = await tenorResultObject.registerShare();
  ///
  /// if (isRegistered != null && isRegistered == 'ok'){
  ///   print('Sharing Registered: $isRegistered');
  /// }else{
  ///   print('not registered ');
  /// }
  /// ```
  ///
  ///
  Future<String?> registerShare() async {
    if (!canShare || keys == null || id == null) {
      return null;
    }
    if (canShare) {
      var result = await _registerShareOperation(keys!, id!);
      if (result.toLowerCase() == 'ok') {
        return 'ok';
      }
      return null;
    }
  }

  String toJson() => json.encode(toMap());

  static TenorResult? fromJson(String source,
          {bool canShare = false, String? keys}) =>
      TenorResult.fromMap(json.decode(source), canShare: canShare, keys: keys);

  @override
  String toString() {
    return 'TenorResult(hasCaption: $hasCaption, hasaudio: $hasaudio, shares: $shares, id: $id, title: $title, created: $created, url: $url, itemurl: $itemurl, media: $media)';
  }

  @override
  List<Object?> get props =>
      [hasCaption, hasaudio, shares, id, title, created, url, itemurl, media];
}
