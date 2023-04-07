part of tenor;

/// Request Gif with `Search` parameter
Future<TenorResponse?> _privateRequestGif(
  EndPoint endPoint,
  String keys, {
  bool random = false,
  int limit = 20,
  SearchFilter? searchFilter = SearchFilter.gif,
  ContentFilter? contentFilter = ContentFilter.high,
  GifSize? size = GifSize.all,
  List<MediaFilter>? mediaFilter = MediaFilter.values,
  String? pos,
}) async {
  // assert limit is between 1 and 50
  assert(limit >= 1 && limit <= 50, 'Limit must be between 1 and 50.');

  var path = '${endPoint.name}$keys';

  path += '&limit=${limit.clamp(1, 50)}';
  path += '&random=$random';

  if (contentFilter != null) {
    path += '&contentfilter=${contentFilter.name}';
  }

  if (mediaFilter != null) {
    path +=
        '&media_filter=${mediaFilter.toSet().toList().map((e) => e.name).join(',')}';
  }

  if (size != null) {
    path += '&ar_range=${size.name}';
  }

  if (searchFilter != null) {
    path += '&searchfilter=${searchFilter.name}';
  }

  if (pos != null) {
    path += '&pos=$pos';
  }

  final data = await _serverRequest(path);
  TenorResponse? res;
  if (data != null && data.length > 0) {
    res = TenorResponse.fromMap(data, endPoint: endPoint, keys: keys);
  }
  return res;
}
