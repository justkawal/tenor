import 'package:tenor/tenor.dart';

void main() async {
  var api = Tenor(apiKey: 'Tenor Api');

  var res = await api.requestImages(limit: 5);

  if (res != null) {
    res.results.forEach((tenorResult) {
      var title = tenorResult.title;
      var media = tenorResult.media;
      print('$title: tiny-gif : ${media?.tinygif?.previewUrl?.toString()}');
      print('$title: gif      : ${media?.gif?.previewUrl?.toString()}');
    });
  }

  res = await api.requestGifWithSearch(search: 'universe', limit: 5);
}
