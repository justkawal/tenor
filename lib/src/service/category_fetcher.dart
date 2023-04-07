part of tenor;

/// Request `Category`
Future<List<TenorCategories?>> _requestTenorCategories(
  EndPoint endPoint,
  String keys, {
  CategoryType categoryType = CategoryType.featured,
  ContentFilter contentFilter = ContentFilter.high,
}) async {
  final path =
      '${endPoint.name}$keys&contentfilter=${contentFilter.name}&type=${categoryType.name}';

  final data = await _serverRequest(path);
  final res = <TenorCategories?>[];
  if (data != null && data is Map && data['tags'] != null) {
    data['tags'].forEach((tag) {
      res.add(TenorCategories.fromMap(tag));
    });
  }
  return res;
}
