part of tenor;

class Tenor {
  final String apiKey;
  final String language;
  final String? client_key;
  final String? country;

  Tenor({
    required this.apiKey,
    this.language = 'en',
    this.client_key,
    this.country,
  }) {
    assert(apiKey.trim() != '', 'Parameter apiKey should not be empty.');

    _key = '?key=$apiKey&locale=$language';

    if (client_key != null) {
      _key += '&client_key=$client_key';
    }
    if (country != null) {
      _key += '&country=$country';
    }
  }
  late final String _key;

  /// Requests Gif from tenor
  ///
  /// For more info on randomGIF: https://tenor.com/gifapi/documentation#endpoints-search
  ///
  ///```dart
  /// var tenorApi = Tenor(apiKey: 'Tenor Api');
  ///
  /// TenorResponse? res = await tenorApi.searchGIF('universe', limit: 5);
  ///```
  Future<TenorResponse?> searchGIF(
    String search, {
    int limit = 20,
    SearchFilter searchFilter = SearchFilter.gif,
    ContentFilter contentFilter = ContentFilter.high,
    GifSize size = GifSize.all,
    List<MediaFilter> mediaFilter = MediaFilter.values,
    bool random = false,
    String? pos,
  }) async {
    return await _privateRequestGif(
      EndPoint.search,
      '$_key&q=$search',
      limit: limit,
      random: random,
      searchFilter: searchFilter,
      contentFilter: contentFilter,
      size: size,
      mediaFilter: mediaFilter,
      pos: pos,
    );
  }

  /// Returns response containing a list of the current global trending GIFs. The trending stream is updated regularly throughout the day.
  ///
  /// Defaults: `contentFilter`: `ContentFilter.high`
  ///
  /// Defaults: `size` : `GifSize.all`
  ///
  /// Defaults: `mediaFilter` : `MediaFilter.minimal`
  ///
  ///```dart
  /// var tenorApi = Tenor(apiKey: 'Tenor Api');
  ///
  /// TenorResponse? res = await tenorApi.requestTrendingGIF();
  ///```
  Future<TenorResponse?> requestFeaturedGIF({
    int limit = 20,
    ContentFilter contentFilter = ContentFilter.high,
    GifSize size = GifSize.all,
    List<MediaFilter> mediaFilter = MediaFilter.values,
  }) async {
    return await _privateRequestGif(
      EndPoint.featured,
      _key,
      limit: limit,
      contentFilter: contentFilter,
      mediaFilter: mediaFilter,
      pos: null,
    );
  }

  /// Requests `Categories` from tenor
  ///
  /// For more info on Categories: https://tenor.com/gifapi/documentation#endpoints-categories
  ///
  ///```dart
  /// var tenorApi = Tenor(apiKey: 'Tenor Api');
  ///
  /// TenorCategories? res = await tenorApi.requestCategories();
  ///```
  Future<List<TenorCategories?>> requestCategories(
      {ContentFilter contentFilter = ContentFilter.high,
      CategoryType categoryType = CategoryType.featured}) async {
    return await _requestTenorCategories(
      EndPoint.categories,
      _key,
      contentFilter: contentFilter,
      categoryType: categoryType,
    );
  }

  /// Search suggestions helps a user narrow their search or discover related search terms to find a more precise GIF. Results are returned in order of what is most likely to drive a share for a given term, based on historic user search and share behavior.
  ///
  /// ```dart
  /// var tenorApi = Tenor(apiKey: 'Tenor Api');
  /// List<String> suggestions = await tenorApi.searchSuggestions('un', limit: 5);
  /// ```
  Future<List<String>> searchSuggestions(
    String search, {
    int limit = 20,
  }) async {
    return await _requestResultStringlist(
      EndPoint.search_suggestions,
      '$_key&q=$search',
      limit: limit,
    );
  }

  /// Returns response containing a list of completed search terms given a partial search term. The list is sorted by `Tenor’s AI` and the number of results will decrease as `Tenor’s AI` becomes more certain.
  ///
  ///
  /// ```dart
  /// var tenorApi = Tenor(apiKey: 'Tenor Api');
  ///
  /// List<String> autoCompletedItems = await tenorApi.autoComplete('un', limit: 5);
  ///```
  Future<List<String>> autoComplete(
    String search, {
    int limit = 20,
  }) async {
    return await _requestResultStringlist(
      EndPoint.autocomplete,
      '$_key&q=$search',
      limit: limit,
    );
  }

  /// Returns response containing a list of the current trending search terms. The list is updated Hourly by Tenor’s AI.
  ///
  /// For more info on trendingSearchTerm: https://tenor.com/gifapi/documentation#endpoints-trendingterms
  ///
  /// ```dart
  /// var tenorApi = Tenor(apiKey: 'Tenor Api');
  /// List<String> trendingSearch = await tenorApi.requestTrendingSearchTerms(limit: 5);
  ///```
  Future<List<String>> requestTrendingSearchTerms({
    int limit = 20,
  }) async {
    return await _requestResultStringlist(
      EndPoint.trending_terms,
      _key,
      limit: limit,
    );
  }

  /// Register a user's sharing of a GIF or sticker.
  ///
  /// ```dart
  /// var tenorApi = Tenor(apiKey: 'Tenor Api');
  ///
  /// bool registeredShare = await tenorApi.registerShare('some gif id from response');
  ///```
  Future<bool> registerShare(String gifId) async {
    return await _registerShareOperation(_key, gifId);
  }

  /// Returns response containing a list of the current global trending GIFs. The trending stream is updated regularly throughout the day.
  ///
  /// Defaults: `contentFilter`: `ContentFilter.high`
  ///
  /// Defaults: `size` : `GifSize.all`
  ///
  /// Defaults: `mediaFilter` : `MediaFilter.minimal`
  ///
  ///```dart
  /// var tenorApi = Tenor(apiKey: 'Tenor Api');
  ///
  /// TenorResponse? res = await tenorApi.requestTrendingGIF();
  ///```
  Future<List<TenorResult>?> requestPosts({
    required List<String> ids,
    List<MediaFilter>? mediaFilter = MediaFilter.values,
  }) async {
    assert(ids.isNotEmpty, 'ids cannot be empty.');

    var path = '${EndPoint.posts.name}$_key&ids=${ids.join(',')}';

    if (mediaFilter != null) {
      path +=
          '&media_filter=${mediaFilter.toSet().toList().map((e) => e.name).join(',')}';
    }

    final data = await _serverRequest(path);
    List<TenorResult>? res;
    if (data != null &&
        data is Map &&
        data['results'] is List &&
        data['results'].isNotEmpty) {
      res =
          (data['results'] as List).map((e) => TenorResult.fromMap(e)).toList();
    }
    return res;
  }
}
