# Tenor
   <a href="https://pub.dartlang.org/packages/tenor">  
    <img src="https://img.shields.io/pub/v/tenor.svg"  
      alt="Pub Package" />  
  </a>
   <a href="https://opensource.org/licenses/MIT">  
    <img src="https://img.shields.io/badge/License-MIT-red.svg"  
      alt="License: MIT" />  
  </a>
  <a href="https://github.com/justkawal/tenor/issues">  
    <img src="https://img.shields.io/github/issues/justkawal/tenor"  
      alt="Issue" />  
  </a> 
   <a href="https://github.com/justkawal/tenor/network">  
    <img src="https://img.shields.io/github/forks/justkawal/tenor"  
      alt="Forks" />  
  </a> 
   <a href="https://github.com/justkawal/tenor/stargazers">  
    <img src="https://img.shields.io/github/stars/justkawal/tenor"  
      alt="Stars" />  
  </a>
  <br>
  <br>
  

### Fetch, Search GIF more easily and customised manner from [Tenor](https://www.pub.dev/packages/tenor)
### This library is MIT licensed, which means you can use it anywhere without any consent from [justkawal](https://github.com/justkawal).

# Table of Contents
  - [Installing](#lets-get-started)
  - [Usage](#usage)
  - [Upcoming Features](#features-coming-in-next-version)

# Lets Get Started

### 1. Depend on it
Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  tenor: ^2.0.0
```

### 2. Install it

You can install packages from the command line:

with `pub`:

```css
$  pub get
```

with `Flutter`:

```css
$  flutter packages get
```

### 3. Import it

Now in your `Dart` code, you can use: 

````dart
import 'package:tenor/tenor.dart';
````

# Usage
## Initialize Tenor
Initialize Tenor library
```dart
Tenor tenor = Tenor(apiKey: 'ApiKey', language: TenorLanguage.English);
```

## Select the Language Codes
TenorLanguage provides codes for different `ISO 639-1 language code`
```dart
var englishCode = TenorLanguage.English;
```

## Fetch Trending GIF
Returns response containing a list of the current global trending GIFs. The trending stream is updated regularly throughout the day.

Important: `limit`: `1 <= limit <= 50`

```dart
// Future<TenorResponse?> requestTrendingGIF({
//   int limit = 20,
//   ContentFilter contentFilter = ContentFilter.high,
//   GifSize size = GifSize.all,
//   MediaFilter mediaFilter = MediaFilter.minimal,
//   bool canRegisterShare = false,
// })

Tenor tenor = Tenor(apiKey: 'Tenor Api');

// fetch trending Gif
TenorResponse? res = await tenor.requestTrendingGIF(limit: 5);
res?.results.forEach((TenorResult tenorResult) {
  var title = tenorResult.title;
  var media = tenorResult.media;
  print('$title: gif : ${media?.gif?.previewUrl?.toString()}');
});
```

## Search GIF
Returns response containing a list of the searched Gif from Tenor.

Important: `limit`: `1 <= limit <= 50`

```dart
// Future<TenorResponse?> searchGIF(
//   String search, {
//   int limit = 20,
//   ContentFilter contentFilter = ContentFilter.high,
//   GifSize size = GifSize.all,
//   MediaFilter mediaFilter = MediaFilter.minimal,
//   bool canRegisterShare = false,
// })

Tenor tenor = Tenor(apiKey: 'Tenor Api');

// search Gif
TenorResponse? res = await tenor.searchGIF('universe', limit: 5);
res?.results.forEach((TenorResult tenorResult) {
  var title = tenorResult.title;
  var media = tenorResult.media;
  print('$title: gif : ${media?.gif?.previewUrl?.toString()}');
});
```

## Fetch Random GIF
Get a randomized list of GIFs for a given search term. This differs from the search function which returns a rank ordered list of GIFs for a given search term.

Important: `limit`: `1 <= limit <= 50`

```dart
// Future<TenorResponse?> randomGIF(
//   String search, {
//   int limit = 20,
//   ContentFilter contentFilter = ContentFilter.high,
//   GifSize size = GifSize.all,
//   MediaFilter mediaFilter = MediaFilter.minimal,
//   bool canRegisterShare = false,
// })

Tenor tenor = Tenor(apiKey: 'Tenor Api');

// random Gif
TenorResponse? res = await tenor.randomGIF('universe', limit: 5);
res?.results.forEach((TenorResult tenorResult) {
  var title = tenorResult.title;
  var media = tenorResult.media;
  print('$title: gif : ${media?.gif?.previewUrl?.toString()}');
});
```

## Search Suggestions
Search suggestions helps a user narrow their search or discover related search terms to find a more precise GIF. Results are returned in order of what is most likely to drive a share for a given term, based on historic user search and share behavior.

Important: `limit`: `1 <= limit <= 50`

```dart
// Future<List<String>> searchSuggestions(
//   String search, {
//   int limit = 20,
//   bool automaticallyRegisterShare = false,
// })

Tenor tenor = Tenor(apiKey: 'Tenor Api');

// suggestions
List<String> suggestions = await tenor.searchSuggestions('universe', limit: 5);
```

## Trending search
Returns response containing a list of the current trending search terms. The list is updated Hourly by Tenor’s AI.

Important: `limit`: `1 <= limit <= 50`

```dart
// Future<List<String>> trendingSearch(
//   int limit = 20,
// })

Tenor tenor = Tenor(apiKey: 'Tenor Api');

// trending search results
List<String> suggestions = await tenor.trendingSearch(limit: 5);
```

## Auto complete
Returns response containing a list of completed search terms given a partial search term. The list is sorted by `Tenor’s AI` and the number of results will decrease as `Tenor’s AI` becomes more certain.

Important: `limit`: `1 <= limit <= 50`

```dart
// Future<List<String>> autoComplete(
//   String search, {
//   int limit = 20,
//   bool automaticallyRegisterShare = false,
// })

Tenor tenor = Tenor(apiKey: 'Tenor Api');

// auto complete results
List<String> autoCompleted = await tenor.autoComplete('un', limit: 5);
```

## Register Share
This helps further tune Tenor’s Search Engine AI, helping users more easily find the perfect GIF.

As Tenor’s service evolves, it will be used to better tune search results to your users’ specific languages, cultures, and social trends.

Note: To use `registerShare` It is important pass the `language_key` on the tenor api initialization.

For more info head to: https://tenor.com/gifapi/documentation#endpoints-registershare
```dart
   Tenor tenor = Tenor(apiKey: 'ApiKey', language: TenorLanguage.English);
   
   TenorResult tenorResultObject = ............;
   
   String? isRegistered = await tenorResultObject.registerShare();
   
   if (isRegistered != null && isRegistered == 'ok'){
      print('Sharing Registered: $isRegistered');
   } else {
      print('not registered ');
   }
```

## Fetching Categories
Requests `Categories` from tenor

```dart
// Future<List<TenorCategories?>> requestCategories({
//   ContentFilter contentFilter = ContentFilter.high,
//   CategoryType categoryType = CategoryType.featured,
// })

Tenor tenor = Tenor(apiKey: 'Tenor Api');

// list of categories
List<TenorCategories?> categories = await tenor.requestCategories();
```

<a href="https://paypal.me/kawal7415">  
    <img src="https://tenor.com/view/google-tenor-gif-gif-12514248.gif" width="70%" height="45%"  
      alt="Donate" />  
  </a>


### Fetching Options
key | description
-------------- | -------------
 limit         | eg. limit the number of GIF to be fetched. limit can vary from `1 to 50`
 contentFilter | (values: `off`, `low`, `medium`, `high`) specify the content safety filter level. eg. `contentFilter: ContentFilter.low`
 mediaFilter   | (values: `basic`, `minimal`) Reduce the Number of GIF formats returned in response. `minimal- (tinygif, gif, and mp4)`.  `basic- (nanomp4, tinygif, tinymp4, gif, mp4, and nanogif)` eg. `mediaFilter: MediaFilter.minimal` 
 size          | GIFs with `aspect ratios` that fit with in the selected range. values: (`all`, `wide`, `standard`), `all` - no constraints, `wide` - 0.42 <= aspect ratio <= 2.36, `standard` - .56 <= aspect ratio <= 1.78


## Fetch Next Set of GIF Response
`fetchNext()` is used to get next set of response for the current query

```dart
// Future<TenorResponse?> fetchNext({int limit = 20});

// here the fetchNext function is used to call next set of GIF which is sequenced after current response

TenorResponse? firstSetResponse = await tenor. /*.... Functions used to get TenorResponse? ....*/

TenorResponse? nextResult = await firstSetResponse?.fetchNext();

nextResult?.results.forEach((tenorResult) {
  var title = tenorResult.title;
  var media = tenorResult.media;
  print('$title: gif : ${media?.gif?.previewUrl?.toString()}');
});
```
### Fetching Next Options
key | description
------------ | -------------
 limit | eg. limit the number of GIF to be fetched. limit can vary from `1 to 50`

# Donate
 -  Your donation would help me to pay my college fees @ [ Fleming College, Canada ].
 -  [Mac](https://www.apple.com)
 -  Paypal: https://paypal.me/kawal7415

# What's next ? 🤔
- We are thinking what we should give next after giving all these features.
- If you have any new feature request then go ahead and ping me, I'll integrate it.
