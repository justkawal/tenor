part of tenor;

class Tenor {
  final String apiKey;
  final String language;

  Tenor({this.apiKey = '', this.language = 'en'}) {
    assert(apiKey.trim() != '', 'Parameter apiKey should not be empty.');
  }

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
  Future<TenorResponse?> requestTrendingGIF({
    int limit = 20,
    ContentFilter contentFilter = ContentFilter.high,
    GifSize size = GifSize.all,
    MediaFilter mediaFilter = MediaFilter.minimal,
    String anon_id = '',
    bool canRegisterShare = false,
  }) async {
    var keys = '?key=$apiKey&locale=$language';

    /// checking to canRegisterShare
    if (canRegisterShare) {
      assert(anon_id.trim() != '',
          'As canRegisterShare is set to true, anon_id should not be null or empty.');
      keys += '&anon_id=$anon_id';
    }
    return await _privateRequestGif(
      EndPoint.trending,
      keys,
      limit: limit,
      canShare: canRegisterShare,
      contentFilter: contentFilter,
      mediaFilter: mediaFilter,
      pos: null,
    );
  }

  /// Requests Gif from tenor
  ///
  /// You can also registerShare the gif sharing by calling `registerShare()` on the `TenorResult` Object
  ///
  /// For more info on registerShare: https://tenor.com/gifapi/documentation#endpoints-registershare
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
    ContentFilter contentFilter = ContentFilter.high,
    GifSize size = GifSize.all,
    MediaFilter mediaFilter = MediaFilter.minimal,
    String anon_id = '',
    bool canRegisterShare = false,
    String? pos,
  }) async {
    var keys = '?key=$apiKey&locale=$language&q=$search';

    /// checking to canRegisterShare
    if (canRegisterShare) {
      assert(anon_id.trim() != '',
          'As canRegisterShare is set to true, anon_id should not be null or empty.');
      keys += '&anon_id=$anon_id';
    }
    return await _privateRequestGif(
      EndPoint.search,
      keys,
      limit: limit,
      canShare: canRegisterShare,
      contentFilter: contentFilter,
      size: size,
      mediaFilter: mediaFilter,
      pos: pos,
    );
  }

  /// Get a randomized list of GIFs for a given search term. This differs from the search endpoint which returns a rank ordered list of GIFs for a given search term.
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
    MediaFilter mediaFilter = MediaFilter.minimal,
    String anon_id = '',
    bool canRegisterShare = false,
  }) async {
    var keys = '?key=$apiKey&locale=$language&q=$search';

    /// checking to canRegisterShare
    if (canRegisterShare) {
      assert(anon_id.trim() != '',
          'As canRegisterShare is set to true, anon_id should not be null or empty.');
      keys += '&anon_id=$anon_id';
    }
    return await _privateRequestGif(
      EndPoint.random,
      keys + '',
      limit: limit,
      canShare: canRegisterShare,
      contentFilter: contentFilter,
      size: size,
      mediaFilter: mediaFilter,
      pos: null,
    );
  }

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
    String anon_id = '',
  }) async {
    var keys = '?key=$apiKey&locale=$language&q=$search';

    if (automaticallyRegisterShare) {
      assert(anon_id.trim() != '',
          'To register share as automaticallyRegisterShare is set to true, anon_id should not be null or empty.');
      keys += '&anon_id=$anon_id';
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
    var keys = '?key=$apiKey&locale=$language';
    return await _requestSearchSuggestions(
      EndPoint.trending_terms,
      keys,
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
    String anon_id = '',
  }) async {
    var keys = '?key=$apiKey&locale=$language&q=$search';

    /// checking to automaticallyRegisterShare
    if (automaticallyRegisterShare) {
      assert(anon_id.trim() != '',
          'To register share as automaticallyRegisterShare is set to true, anon_id should not be null or empty.');
      keys += '&anon_id=$anon_id';
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
    var keys = '?key=$apiKey&locale=$language';
    return await _requestTenorCategories(
      EndPoint.categories,
      keys,
      contentFilter: contentFilter,
      categoryType: categoryType,
    );
  }

  /// Requests `anon_id` from tenor
  ///
  /// Get an anonymous ID for a new user.
  /// Store the ID in the client’s cache for use on any additional API calls made by the user, either in this session or any future sessions.
  ///
  /// Note: using anonymous ID to personalize API responses requires custom development.
  ///
  /// For more info on anon_id: https://tenor.com/gifapi/documentation#endpoints-anonymousid
  ///
  ///```dart
  /// var tenorApi = Tenor(apiKey: 'Tenor Api');
  ///
  /// String? res = await tenorApi.generateAnonId();
  ///```
  Future<String?> generateAnonId() async {
    var path = EndPoint.anonid.toString().enumVal + '?key=$apiKey';

    var data = await _serverRequest(path);
    return data['anon_id'];
  }
}

extension _TenorString on String {
  String get enumVal {
    var list = split('.');
    return list.last;
  }
}
