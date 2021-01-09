part of tenor;

class Tenor {
  final String apiKey;
  String language;

  Tenor({this.apiKey, String language}) {
    this.language = language ?? 'en';
  }

  Future<TenorResponse> requestImages({
    int limit,
    int page,
    ContentFilter contentFilter,
    MediaFilter mediaFilter,
  }) async {
    return requestGifWithSearch(limit: limit);
  }

  Future getImages(String url) async {
    var httpClient = HttpClient();
    var request = await httpClient.getUrl(Uri.parse(url));
    var response = await request.close();
    if (response.statusCode == 200) {
      var json = await utf8.decoder.bind(response).join();
      var data = jsonDecode(json);
      return data;
    } else {
      // something went wrong :(
      print('Http error: ${response.statusCode}');
      return [];
    }
  }

  Future<TenorResponse> requestGifWithSearch({
    String search,
    int limit,
    ContentFilter contentFilter,
    MediaFilter mediaFilter,
  }) async {
    var url = 'https://api.tenor.com/v1/search';
    if (limit < 3) {
      limit = 3;
    }

    limit ??= 5;
    url += '?key=' + apiKey;
    url += '&limit=$limit';

    if (contentFilter == null) {
      url += '&contentfilter=high';
    } else {
      // url += '$contentFilter'.enumVal;
    }
    if (mediaFilter == null) {
      url += '&media_filter=minimal';
    } else {
      // url += '$mediaFilter'.enumVal;
    }

    if (search != null) url += '&q=' + Uri.encodeFull(search);
    var data = await getImages(url);
    TenorResponse res;
    if (data != null && data.length > 0) {
      res = TenorResponse.fromMap(data);
    }
    return res;
  }
}
