import 'package:tenor/src/utility/language_codes.dart';
import 'package:tenor/tenor.dart';
import 'dart:io';

int i = 0;
void main() async {
  // replce 'ApiKey' with your own key -> 'You Own Api Key'
  final apiKey = File('/path to api key/apiKey').readAsStringSync();
  final api = Tenor(apiKey: apiKey, language: TenorLanguage.English);

  ///
  /// exmaple of searching of keyword on tenor
  ///
  print(' Fetching 5 donate searched Gif ');
  var res = await api.searchGIF('donate', limit: 5);
  printTenorResponse(res);

  log(' Fetching Next 5 Results ');
  printTenorResponse(await res?.fetchNext(limit: 5));

  ///
  /// exmaple of requesting trending Gif
  ///

  log('Fetching 5 Trending Gif');
  res = await api.requestTrendingGIF(limit: 5);
  if (res?.results.isNotEmpty ?? false) {
    final val = await res?.results.first.registerShare();
    print(val.toString());
  }
  //printTenorResponse(res);

  /// next results
  log('Fetching Next 5 Resultsf');
  printTenorResponse(await res?.fetchNext(limit: 5));

  ///
  /// exmaple of requesting categories
  ///

  log(' Fetching Categories ');
  final categories = await api.requestCategories();
  print(categories.join('\n').toString());

  ///
  /// exmaple of requesting auto complete list of possible words based on search parameter
  ///

  log(' Fetching Auto Complete Suggestions ');
  final suggestions = await api.autoComplete('doc');
  print(suggestions.toString());
}

void printTenorResponse(TenorResponse? res) {
  res?.results.forEach((tenorResult) {
    final title = tenorResult.title;
    final media = tenorResult.media;
    print('$title: gif   ${i++}   : ${media?.gif?.previewUrl?.toString()}');
  });
}

void log(String s) => print('\n\n--------- $s ------------\n\n');
