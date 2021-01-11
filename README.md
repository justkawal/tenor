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
  
# Donate [![ ](https://img.shields.io/endpoint.svg?url=https%3A%2F%2Fshieldsio-patreon.vercel.app%2Fapi%3Fusername%3Djustkawal%26type%3Dpatrons&style=for-the-badge)](https://patreon.com/justkawal)
<a href="https://patreon.com/justkawal">  
    <img src="https://tenor.com/view/pass-the-hat-dollar-bills-money-cash-collect-gif-13703355.gif"  width="70%" height="45%"  
      alt="Donate" />  
  </a>
 
### Fetch, Search GIF more easily and customised manner from [Tenor](https://www.pub.dev/packages/tenor)

# Table of Contents
  - [Installing](#lets-get-started)
  - [Usage](#usage)
  - [Upcoming Features](#features-coming-in-next-version)

# Lets Get Started

### 1. Depend on it
Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  tenor:
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
var api = Tenor(apiKey: 'WVWVKIKO0J5W');
```

## Fetch Trending GIF
Fetch some Trending GiIF
```dart
//requestTrendingGIF({int limit = 1, String contentFilter = ContentFilter.off, String mediaFilter = MediaFilter.minimal});

// fetch trending GIF
TenorResponse res = await api.requestTrendingGIF(limit: 5);
res.results.forEach((tenorResult) {
  var title = tenorResult.title;
  var media = tenorResult.media;
  print('$title: gif      : ${media?.gif?.previewUrl?.toString()}');
});
```

## Search for GIF
Search for the GIF
```dart
//searchGIF(String search, {int limit = 1, String contentFilter = ContentFilter.off, String mediaFilter = MediaFilter.minimal});

TenorResponse res = await api.searchGIF('subscribe mrbeast', limit: 5);
res.results.forEach((tenorResult) {
  var title = tenorResult.title;
  var media = tenorResult.media;
  print('$title: gif      : ${media?.gif?.previewUrl?.toString()}');
});
```

<a href="https://patreon.com/justkawal">  
    <img src="https://tenor.com/view/subscribe-digibyte-mr-beast-human-atm-sub-now-gif-19759335.gif"  width="70%" height="45%"  
      alt="Donate" />  
  </a>


### Fetching Options
key | description
------------ | -------------
 limit | eg. limit the number of GIF to be fetched. limit can vary from `1 to 50`
 contentFilter | default: `low`. (values: `off`, `low`, `medium`, `high`) specify the content safety filter level. eg. `contentFilter: ContentFilter.low`
 mediaFilter | default: `minimal`. (values: `basic`, `minimal`) Reduce the Number of GIF formats returned in response. `minimal- (tinygif, gif, and mp4)`.  `basic- (nanomp4, tinygif, tinymp4, gif, mp4, and nanogif)` eg. `mediaFilter: MediaFilter.minimal`


## Fetch Next Set of GIF Response
`fetchNext()` is used to get next set of response for the current query

```dart
// fetchNext({int limit = 1});

// here the fetchNext function is used to call next set of GIF for the current response
TenorResponse nextResult = await res.fetchNext();
print('next results');
nextResult.results.forEach((tenorResult) {
  var title = tenorResult.title;
  var media = tenorResult.media;
  print('$title: gif      : ${media?.gif?.previewUrl?.toString()}');
});
```
### Fetching Next Options
key | description
------------ | -------------
 limit | eg. limit the number of GIF to be fetched. limit can vary from `1 to 50`


## Features coming in next version
On-going implementation for future:
- Some more Functions
 - Fetch Categories
 - Download GIF
