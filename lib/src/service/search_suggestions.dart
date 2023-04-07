part of tenor;

Future<List<String>> _requestResultStringlist(
  EndPoint endPoint,
  String keys, {
  int limit = 20,
}) async {
  final path = '${endPoint.name}$keys&limit=${limit.clamp(1, 50)}';

  final data = await _serverRequest(path);
  if (data != null && data.isNotEmpty) {
    return (data['results'] as List).map((e) => '$e').toList();
  }
  return <String>[];
}
