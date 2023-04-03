part of tenor;

class Tenor {
  final String apiKey;
  final String language;
  final String? client_key;

  Tenor({required this.apiKey, this.language = 'en', this.client_key})
      : assert(apiKey.trim() != '', 'Parameter apiKey should not be empty.'),

        // making key
        _key =
            '?key=$apiKey&locale=$language${client_key != null ? '&client_key=$client_key' : ''}';

  late final String _key;

  /// Returns response containing a list of the current global trending GIFs. The trending stream is updated regularly throughout the day.
  ///
  /// You can also registerShare the gif sharing by calling `registerShare()` on the `TenorResult` Object
  ///
  /// For more info on registerShare: https://tenor.com/gifapi/documentation#endpoints-registershare
  ///
  /// For more info on randomGIF: https://tenor.com/gifapi/documentation#endpoints-trendinggifs
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
  /// TenorResponse? res = await tenorApi.requestTrendingGIF(limit: 5);
  ///```
  /* Future<TenorResponse?> requestTrendingGIF({
    int limit = 20,
    ContentFilter contentFilter = ContentFilter.high,
    GifSize size = GifSize.all,
    List<MediaFilter> mediaFilter = MediaFilter.values,
    bool canRegisterShare = false,
  }) async {
    return await _privateRequestGif(
      EndPoint.trending,
      _key,
      limit: limit,
      canShare: canRegisterShare,
      contentFilter: contentFilter,
      mediaFilter: mediaFilter,
      pos: null,
    );
  } */

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
    bool canRegisterShare = false,
    bool random = false,
    String? pos,
  }) async {
    return await _privateRequestGif(
      EndPoint.search,
      '$_key&q=$search',
      limit: limit,
      random: random,
      searchFilter: searchFilter,
      canShare: canRegisterShare,
      contentFilter: contentFilter,
      size: size,
      mediaFilter: mediaFilter,
      pos: pos,
    );
  }

/*   /// Get a randomized list of GIFs for a given search term. This differs from the search endpoint which returns a rank ordered list of GIFs for a given search term.
  ///
  /// You can also registerShare the gif sharing by calling `registerShare()` on the `TenorResult` Object
  ///
  /// For more info on registerShare: https://tenor.com/gifapi/documentation#endpoints-registershare
  ///
  /// For more info on randomGIF: https://tenor.com/gifapi/documentation#endpoints-random
  ///
  ///```dart
  ///
  /// var tenorApi = Tenor(apiKey: 'Tenor Api');
  /// TenorResponse? res = await tenorApi.searchGIF('universe', limit: 5);
  ///```
  Future<TenorResponse?> randomGIF(
    String search, {
    int limit = 20,
    ContentFilter contentFilter = ContentFilter.high,
    GifSize size = GifSize.all,
    List<MediaFilter> mediaFilter = MediaFilter.values,
    bool canRegisterShare = false,
  }) async {
    final keys = '$_key&q=$search';
    return await _privateRequestGif(
      EndPoint.random,
      keys,
      limit: limit,
      canShare: canRegisterShare,
      contentFilter: contentFilter,
      size: size,
      mediaFilter: mediaFilter,
      pos: null,
    );
  } */

  /// Search suggestions helps a user narrow their search or discover related search terms to find a more precise GIF. Results are returned in order of what is most likely to drive a share for a given term, based on historic user search and share behavior.
  ///
  /// You can also registerShare this call by setting `automaticallyRegisterShare: true`
  ///
  /// For more info on registerShare: https://tenor.com/gifapi/documentation#endpoints-registershare
  ///
  /// ```dart
  /// var tenorApi = Tenor(apiKey: 'Tenor Api');
  /// List<String> suggestions = await tenorApi.searchSuggestions('un', limit: 5);
  /// ```
  Future<List<String>> searchSuggestions(
    String search, {
    int limit = 20,
    bool automaticallyRegisterShare = false,
  }) async {
    final keys = '$_key&q=$search';

    if (automaticallyRegisterShare) {
      await _registerShareOperation(keys, '');
    }
    return await _requestSearchSuggestions(
      EndPoint.search_suggestions,
      keys,
      limit: limit,
    );
  }

  /// Returns response containing a list of the current trending search terms. The list is updated Hourly by Tenor’s AI.
  ///
  /// For more info on trendingSearchTerm: https://tenor.com/gifapi/documentation#endpoints-trendingterms
  ///
  /// ```dart
  /// var tenorApi = Tenor(apiKey: 'Tenor Api');
  /// List<String> trendingSearch = await tenorApi.trendingSearch(limit: 5);
  ///```
  Future<List<String>> trendingSearch({
    int limit = 20,
  }) async {
    return await _requestSearchSuggestions(
      EndPoint.trending_terms,
      _key,
      limit: limit,
    );
  }

  /// Returns response containing a list of completed search terms given a partial search term. The list is sorted by `Tenor’s AI` and the number of results will decrease as `Tenor’s AI` becomes more certain.
  ///
  /// You can also registerShare this call by setting `automaticallyRegisterShare: true`
  ///
  /// For more info on registerShare: https://tenor.com/gifapi/documentation#endpoints-registershare
  ///
  /// ```dart
  /// var tenorApi = Tenor(apiKey: 'Tenor Api');
  ///
  /// List<String> autoCompletedItems = await tenorApi.autoComplete('un', limit: 5);
  ///```
  Future<List<String>> autoComplete(
    String search, {
    int limit = 20,
    bool automaticallyRegisterShare = false,
  }) async {
    final keys = '$_key&q=$search';

    /// checking to automaticallyRegisterShare
    if (automaticallyRegisterShare) {
      await _registerShareOperation(keys, '');
    }
    return await _requestSearchSuggestions(
      EndPoint.autocomplete,
      keys,
      limit: limit,
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
}
