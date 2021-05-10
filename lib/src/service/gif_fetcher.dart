part of tenor;

/// Request Gif with `Search` parameter
Future<TenorResponse?> _privateRequestGif(
  EndPoint endPoint,
  String keys, {
  bool canShare = false,
  int limit = 1,
  ContentFilter? contentFilter = ContentFilter.high,
  GifSize? size = GifSize.all,
  MediaFilter? mediaFilter = MediaFilter.minimal,
  String? pos,
}) async {
  var path = (endPoint.toString().enumVal) + keys;

  path += '&limit=${limit.clamp(1, 50)}';

  if (contentFilter != null) {
    path += '&contentfilter=' + contentFilter.toString().enumVal;
  }
  if (mediaFilter != null) {
    path += '&media_filter=' + mediaFilter.toString().enumVal;
  }
  if (size != null) {
    path += '&ar_range=' + size.toString().enumVal;
  }
  if (pos != null) {
    path += '&pos=$pos';
  }

  var data = await _serverRequest(path);
  TenorResponse? res;
  if (data != null && data.length > 0) {
    res = TenorResponse.fromMap(data,
        endPoint: endPoint, keys: keys, canShare: canShare);
  }
  return res;
}
