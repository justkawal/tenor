import 'package:tenor/tenor.dart';
import 'dart:io';

void main() async {
  // replce 'ApiKey' with your own key -> 'You Own Api Key'
  var apiKey =
      File('/Users/kawal/Desktop/tenor/example/apiKey').readAsStringSync();
  var api = Tenor(apiKey: '$apiKey');

  print('\n\n--------- Fetching 5 donate searched Gif ------------\n\n');
  var res = await api.searchGIF('donate', limit: 5);
  var i = 1;
  if (res != null) {
    res.results.forEach((tenorResult) {
      var title = tenorResult.title;
      var media = tenorResult.media;
      print('$title: gif   ${++i}   : ${media?.gif?.previewUrl?.toString()}');
    });
    await res.fetchNext(limit: 5).then((nextResult) {
      print(
          '\n\n--------------- Fetching Next 5 Results of donate Searched Gif ---------------\n\n');
      nextResult?.results.forEach((tenorResult) {
        var title = tenorResult.title;
        var media = tenorResult.media;
        print('$title: gif   ${++i}   : ${media?.gif?.previewUrl?.toString()}');
      });
    });
  }
  print('\n\n--------- Fetching 5 Trending Gif ------------\n\n');

  res = await api.requestTrendingGIF(limit: 5);

  if (res != null) {
    res.results.forEach((tenorResult) {
      var title = tenorResult.title;
      var media = tenorResult.media;
      print('$title: gif   ${++i}   : ${media?.gif?.previewUrl?.toString()}');
    });
    await res.fetchNext(limit: 5).then((nextResult) {
      print(
          '\n\n--------------- Fetching Next 5 Results of Trending Gif---------------\n\n');
      nextResult?.results.forEach((tenorResult) {
        var title = tenorResult.title;
        var media = tenorResult.media;
        print('$title: gif   ${++i}   : ${media?.gif?.previewUrl?.toString()}');
      });
    });
  }

  print('\n\n--------- Fetching Categories ------------\n\n');
  var categories = await api.requestCategories();
  print(categories.join('\n').toString());

  print('\n\n--------- Fetching Auto Complete Suggestions ------------\n\n');
  var suggestions = await api.autoComplete('a', limit: 20);
  print(suggestions.toString());
}
