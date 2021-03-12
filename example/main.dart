import 'package:tenor/tenor.dart';
import 'dart:io';

void main() async {
  // replce 'ApiKey' with your own key -> 'You Own Api Key'
  var apiKey =
      File('/Users/kawal/Desktop/tenor/example/apiKey').readAsStringSync();
  var api = Tenor(apiKey: '$apiKey');

  var res = await api.searchGIF('donate', limit: 35);
  var i = 1;
  if (res != null) {
    res.results.forEach((tenorResult) {
      var title = tenorResult.title;
      var media = tenorResult.media;
      print('$title: gif   $i   : ${media?.gif?.previewUrl?.toString()}');
      i++;
    });
    await res.fetchNext(limit: 5).then((nextResult) {
      print('next results');
      nextResult?.results.forEach((tenorResult) {
        var title = tenorResult.title;
        var media = tenorResult.media;
        print('$title: gif      : ${media?.gif?.previewUrl?.toString()}');
      });
    });
  }
  print('\n---------------------\n');

  res = await api.requestTrendingGIF(limit: 5);

  if (res != null) {
    res.results.forEach((tenorResult) {
      var title = tenorResult.title;
      var media = tenorResult.media;
      print('$title: gif      : ${media?.gif?.previewUrl?.toString()}');
    });
    await res.fetchNext(limit: 5).then((nextResult) {
      print('next results');
      nextResult?.results.forEach((tenorResult) {
        var title = tenorResult.title;
        var media = tenorResult.media;
        print('$title: gif      : ${media?.gif?.previewUrl?.toString()}');
      });
    });
  }
}
