import 'package:tenor/tenor.dart';

void main() async {
  var api = Tenor(apiKey: 'Tenor Api');

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
