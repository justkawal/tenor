import 'package:tenor/src/utility/language_codes.dart';
import 'package:tenor/tenor.dart';
import 'dart:io';

int i = 0;
void main() async {
  // replce 'ApiKey' with your own key -> 'You Own Api Key'
  final apiKey = File('./example/api_key').readAsStringSync();
  final api = Tenor(apiKey: apiKey, language: TenorLanguage.English);

  ///
  /// exmaple of searching of keyword on tenor
  ///
  print(' Fetching 5 donate searched Gif ');
  var res = await api.searchGIF(
    'donate',
    limit: 5,
    mediaFilter: MediaFilter.values,
  );
  print(res);

  log(' Fetching Next 5 Results ');
  print(await res?.fetchNext(limit: 5));

  ///
  /// exmaple of requesting featured Gif

  log('Fetching 5 Featured Gif');
  res = await api.requestFeaturedGIF(limit: 5);
  if (res?.results.isNotEmpty ?? false) {
    final val = await res?.results.first.registerShare();
    print(val.toString());
  }
  //print(res);

  /// next results
  log('Fetching Next 5 Resultsf');
  print(await res?.fetchNext(limit: 5));

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

  final posts = await api.requestPosts(
    ids: ['4284007372119812404', '16908095044322257864', '2813501485379157722'],
  );
  print(posts);
}

void log(String s) => print('\n\n--------- $s ------------\n\n');
