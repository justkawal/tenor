part of tenor;

/// Request Gif with `Search` parameter
Future<List<String>> _requestSearchSuggestions(
  EndPoint endPoint,
  String keys, {
  int limit = 1,
}) async {
  var path =
      endPoint.toString().enumVal + keys + '&limit=${limit.clamp(1, 50)}';

  var data = await _serverRequest(path);
  if (data != null && data.isNotEmpty) {
    return (data['results'] as List).map((e) => '$e').toList();
  }
  return <String>[];
}
