part of tenor;

Future _serverRequest(String uri) async {
  final request = await HttpClient().getUrl(Uri.parse(_tenorBaseUrl + uri));
  final response = await request.close();
  switch (response.statusCode) {
    case 200:
    case 202:
      return jsonDecode(await response.transform(utf8.decoder).join());
    default:
      throw Exception(
          'Error: ${response.statusCode}: ${response.reasonPhrase}');
  }
}
