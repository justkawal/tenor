part of tenor;

/// Request Gif with `Search` parameter
Future<TenorResponse?> _privateRequestGif(
  String url, {
  int limit = 1,
  ContentFilter? contentFilter = ContentFilter.off,
  GifSize? size = GifSize.all,
  MediaFilter? mediaFilter = MediaFilter.minimal,
  String? pos,
}) async {
  // storing the temp url for fetching the next counts.
  var tempUrl = url;

  url += '&limit=${limit.clamp(1, 50)}';

  if (contentFilter != null) {
    url += '&contentfilter=' + contentFilter.toString().enumVal;
  }
  if (mediaFilter != null) {
    url += '&media_filter=' + mediaFilter.toString().enumVal;
  }
  if (size != null) {
    url += '&ar_range=' + size.toString().enumVal;
  }
  if (pos != null) {
    url += '&pos=$pos';
  }

  var data = await _serverRequest(url);
  TenorResponse? res;
  if (data != null && data.length > 0) {
    res = TenorResponse.fromMap(data, urlNew: tempUrl);
  }
  return res;
}
