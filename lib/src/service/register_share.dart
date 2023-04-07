part of tenor;

Future<bool> _registerShareOperation(String keys, String? gifId) async {
  var path = EndPoint.registershare.name + keys;
  if (gifId != null) {
    /// gifId will be null when we are registering the share about the search for auto-complete or search-suggestions.
    path += '&id=$gifId';
  }
  await _serverRequest(path);
  return true;
}
