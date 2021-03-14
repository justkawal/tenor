part of tenor;

Future _serverRequest(String url) async {
  var httpClient = HttpClient();
  var request = await httpClient.getUrl(Uri.parse(url));
  var response = await request.close();
  if (response.statusCode == 200) {
    var json = await utf8.decoder.bind(response).join();
    var data = jsonDecode(json);
    return data;
  } else {
    // something went wrong :(
    return [];
  }
}
