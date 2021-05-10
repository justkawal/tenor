part of tenor;

/// Request `Category`
Future<List<TenorCategories?>> _requestTenorCategories(
  EndPoint endPoint,
  String keys, {
  CategoryType categoryType = CategoryType.featured,
  ContentFilter contentFilter = ContentFilter.high,
}) async {
  var path = (endPoint.toString().enumVal) +
      '&contentfilter=' +
      contentFilter.toString().enumVal +
      '&type=' +
      categoryType.toString().enumVal;

  var data = await _serverRequest(path);
  var res = <TenorCategories?>[];
  if (data != null && data['tags'] != null) {
    data['tags'].forEach((tag) {
      res.add(TenorCategories.fromMap(tag));
    });
  }
  return res;
}
