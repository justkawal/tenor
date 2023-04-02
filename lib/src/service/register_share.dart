part of tenor;

Future<String> _registerShareOperation(String keys, String? gifId) async {
  var path = EndPoint.registershare.name + keys;
  if (gifId != null) {
    /// gifId will be null when we are registering the share about the search for auto-complete or search-suggestions.
    path += '&id=$gifId';
  }
  final result = await _serverRequest(path);
  if (result.isNotEmpty &&
      result[0]['status']?.toString().toLowerCase() == 'ok') {
    return 'ok';
  }
  return '';
}
