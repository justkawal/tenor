part of tenor;

/// Request Gif with `Search` parameter
Future<List<String>> _requestSearchSuggestions(
  String url, {
  int limit = 1,
}) async {
  url += '&limit=${limit.clamp(1, 50)}';

  var data = await _serverRequest(url);
  if (data != null && data.isNotEmpty) {
    return (data['results'] as List).map((e) => '$e').toList();
  }
  return <String>[];
}
