part of tenor;

class Tenor {
  final String apiKey;
  String language;

  Tenor({this.apiKey, String language}) {
    this.language = language ?? 'en';
  }

  /// All the trending GIF will be fetched
  ///```dart
  /// var api = Tenor(apiKey: 'Tenor Api');
  ///
  /// var res = await api.requestTrendingGIF(limit: 5);
  ///
  /// if (res != null) {
  ///   res.results.forEach((tenorResult) {
  ///     var title = tenorResult.title;
  ///     var media = tenorResult.media;
  ///     print('$title: gif      : ${media?.gif?.previewUrl?.toString()}');
  ///   });
  ///   await res.fetchNext().then((nextResult) {
  ///     print('next results');
  ///     nextResult.results.forEach((tenorResult) {
  ///       var title = tenorResult.title;
  ///       var media = tenorResult.media;
  ///       print('$title: gif      : ${media?.gif?.previewUrl?.toString()}');
  ///     });
  ///   });
  /// }
  ///```
  Future<TenorResponse> requestTrendingGIF({
    int limit = 1,
    String contentFilter = ContentFilter.off,
    String mediaFilter = MediaFilter.minimal,
  }) async {
    var url = 'https://api.tenor.com/v1/trending?key=$apiKey';
    return await _privateRequestGif(
      url,
      limit: limit,
      contentFilter: contentFilter,
      mediaFilter: mediaFilter,
      pos: null,
    );
  }

  /// Requests Gif from tenor
  ///
  ///```dart
  /// var api = Tenor(apiKey: 'Tenor Api');
  ///
  /// var res = await api.searchGIF('', limit: 5);
  ///
  /// if (res != null) {
  ///   res.results.forEach((tenorResult) {
  ///     var title = tenorResult.title;
  ///     var media = tenorResult.media;
  ///     print('$title: gif      : ${media?.gif?.previewUrl?.toString()}');
  ///   });
  ///   await res.fetchNext().then((nextResult) {
  ///     print('next results');
  ///     nextResult.results.forEach((tenorResult) {
  ///       var title = tenorResult.title;
  ///       var media = tenorResult.media;
  ///       print('$title: gif      : ${media?.gif?.previewUrl?.toString()}');
  ///     });
  ///   });
  /// }
  ///```
  Future<TenorResponse> searchGIF(
    String search, {
    int limit = 1,
    String contentFilter = ContentFilter.off,
    String mediaFilter = MediaFilter.minimal,
  }) async {
    var url = 'https://api.tenor.com/v1/search?key=$apiKey&q=$search';
    return await _privateRequestGif(
      url,
      limit: limit,
      contentFilter: contentFilter,
      mediaFilter: mediaFilter,
      pos: null,
    );
  }
}

extension TenorString on String {
  String get enumVal {
    var list = this?.split('.');
    return (list?.isEmpty ?? true) ? null : list.last;
  }
}
