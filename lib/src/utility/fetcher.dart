part of tenor;

/// Request Gif with `Search` parameter
Future<TenorResponse> _privateRequestGif(
  String url, {
  int limit = 1,
  String contentFilter = ContentFilter.high,
  String mediaFilter = MediaFilter.basic,
  String pos,
}) async {
  // storing the temp url for fetching the next counts.
  var tempUrl = url;

  url += '&limit=${limit?.clamp(1, 50) ?? 1}';

  if (contentFilter != null) {
    url += '&contentfilter=$contentFilter'.enumVal;
  }
  if (mediaFilter != null) {
    url += '&media_filter=$mediaFilter'.enumVal;
  }
  if (pos != null) {
    url += '&pos=$pos';
  }

  var data = await _getImages(url);
  TenorResponse res;
  if (data != null && data.length > 0) {
    res = TenorResponse.fromMap(data, urlNew: tempUrl);
  }
  return res;
}

Future _getImages(String url) async {
  var httpClient = HttpClient();
  var request = await httpClient.getUrl(Uri.parse(url));
  var response = await request.close();
  if (response.statusCode == 200) {
    var json = await utf8.decoder.bind(response).join();
    var data = jsonDecode(json);
    return data;
  } else {
    // something went wrong :(
    return [];
  }
}
