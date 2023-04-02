part of tenor;

Future _serverRequest(String uri) async {
  final httpClient = HttpClient();
  final request = await httpClient.getUrl(Uri.parse(_tenorBaseUrl + uri));
  final response = await request.close();
  if (response.statusCode == 200) {
    final stringData = await response.transform(utf8.decoder).join();
    return jsonDecode(stringData);
  } else {
    // something went wrong :(
    return [];
  }
}
