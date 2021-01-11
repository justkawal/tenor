import 'package:tenor/tenor.dart';
void main() async {
  // replce 'ApiKey' with your own key -> 'You Own Api Key'
  var apiKey = 'ApiKey';
  var api = Tenor(apiKey: '$apiKey');

  var res = await api.searchGIF('donate', limit: 5);

  if (res != null) {
    res.results.forEach((tenorResult) {
      var title = tenorResult.title;
      var media = tenorResult.media;
      print('$title: gif      : ${media?.gif?.previewUrl?.toString()}');
    });
    await res.fetchNext().then((nextResult) {
      print('next results');
      nextResult.results.forEach((tenorResult) {
        var title = tenorResult.title;
        var media = tenorResult.media;
        print('$title: gif      : ${media?.gif?.previewUrl?.toString()}');
      });
    });
  }
}
