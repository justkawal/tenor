part of tenor;

/// Request `Category`
Future<List<TenorCategories>> _requestTenorCategories(
  String url, {
  CategoryType categoryType = CategoryType.featured,
  ContentFilter contentFilter = ContentFilter.high,
}) async {
  url += '&contentfilter=' + contentFilter.toString().enumVal;

  url += '&type=' + categoryType.toString().enumVal;

  var data = await _serverRequest(url);
  var res = <TenorCategories>[];
  if (data != null && data['tags'] != null) {
    data['tags'].forEach((tag) {
      res.add(TenorCategories.fromMap(tag));
    });
  }
  return res;
}
