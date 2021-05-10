part of tenor;

Future _serverRequest(String url) async {
  var httpClient = HttpClient();
  var request = await httpClient.getUrl(Uri.parse(_tenorBaseUrl + url));
  var response = await request.close();
  if (response.statusCode == 200) {
    var json = await utf8.decoder.bind(response).join();
    return jsonDecode(json);
  } else {
    // something went wrong :(
    return [];
  }
}
