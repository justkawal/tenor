part of tenor;

// ignore: must_be_immutable
class TenorResult extends Equatable {
  /// A Unix timestamp that represents when this post was created.
  final DateTime created;

  /// Returns true if this post contains audio.
  final bool hasaudio;

  /// Tenor result identifier
  final String id;

  /// A dictionary with a [content_format](https://developers.google.com/tenor/guides/response-objects-and-errors#content-formats) as the key and a [Media Object](https://developers.google.com/tenor/guides/response-objects-and-errors#media-object) as the value.
  final TenorGif media_formats;

  /// An array of tags for the post
  final List<String> tags;

  /// The title of the post
  final String title;

  /// A textual description of the content.
  ///
  /// We recommend that you use content_description for user accessibility features.
  final String content_description;

  /// The full URL to view the post on [tenor.com](https://tenor.com)
  final String itemurl;

  /// Returns true if this post contains captions.
  final bool hasCaption;

  /// Comma-separated list to signify whether the content is a sticker or static image, has audio, or is any combination of these.
  /// If sticker and static aren't present, then the content is a GIF.
  /// A blank flags field signifies a GIF without audio.
  final List<String> flags;

  final String? keys;

  /// A short URL to view the post on [tenor.com](https://tenor.com)
  final String? url;
  const TenorResult({
    required this.created,
    this.hasaudio = false,
    required this.id,
    required this.media_formats,
    this.tags = const <String>[],
    required this.title,
    required this.content_description,
    required this.itemurl,
    this.hasCaption = false,
    required this.flags,
    this.keys,
    this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'created': created.millisecondsSinceEpoch ~/ 1000,
      'hasaudio': hasaudio,
      'id': id,
      'media_formats': media_formats.toMap(),
      'tags': tags,
      'title': title,
      'content_description': content_description,
      'itemurl': itemurl,
      'hasCaption': hasCaption,
      'flags': flags,
      'url': url,
    };
  }

  static TenorResult fromMap(Map<String, dynamic> map, {String? keys}) {
    return TenorResult(
      created:
          DateTime.fromMillisecondsSinceEpoch(map['created'].round() * 1000),
      hasaudio: map['hasaudio'] ?? false,
      id: map['id'],
      media_formats: TenorGif.fromMap(map['media_formats']),
      tags: List<String>.from(map['tags'] ?? <String>[], growable: false),
      title: map['title'],
      content_description: map['content_description'],
      itemurl: map['itemurl'],
      hasCaption: map['hascaption'] ?? false,
      flags: List<String>.from(map['flags'] ?? <String>[], growable: false),
      keys: keys,
      url: map['url'],
    );
  }

  /// This helps further tune Tenor’s Search Engine AI, helping users more easily find the perfect GIF.
  ///
  /// As Tenor’s service evolves, it will be used to better tune search results to your users’ specific languages, cultures, and social trends.
  ///
  /// Note: To use `registerShare` It is important pass the `language_key` on the tenor api initialization.
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
  /// if (isRegistered != null && isRegistered){
  ///   print('Share Registered');
  /// }else{
  ///   print('Share not Registered');
  /// }
  /// ```
  ///
  ///
  Future<bool?> registerShare() async {
    if (keys == null) {
      return null;
    }

    return await _registerShareOperation(keys!, id);
  }

  String toJson() => json.encode(toMap());

  static TenorResult fromJson(String source, {String? keys}) =>
      TenorResult.fromMap(json.decode(source), keys: keys);

  @override
  String toString() {
    return '''
    TenorResult(
      created: $created,
      hasaudio: $hasaudio,
      id: $id,
      media_formats: $media_formats,
      tags: $tags,
      title: $title,
      content_description: $content_description,
      itemurl: $itemurl,
      hasCaption: $hasCaption,
      flags: $flags,
      keys: $keys,
      url: $url,
    )
''';
  }

  @override
  List<Object?> get props => [
        created,
        hasaudio,
        id,
        media_formats,
        tags,
        title,
        content_description,
        itemurl,
        hasCaption,
        flags,
        keys,
        url
      ];
}
