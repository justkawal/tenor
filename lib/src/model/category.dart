part of tenor;

// ignore: must_be_immutable
class TenorCategories extends Equatable {
  final String searchTerm;
  final String path;
  final String image;
  final String name;
  const TenorCategories({
    required this.searchTerm,
    required this.path,
    required this.image,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'searchterm': searchTerm,
      'path': path,
      'image': image,
      'name': name,
    };
  }

  static TenorCategories fromMap(Map<String, dynamic> map) {
    return TenorCategories(
      searchTerm: map['searchterm'],
      path: map['path'],
      image: map['image'],
      name: map['name'],
    );
  }

  static TenorCategories fromJson(String source) =>
      TenorCategories.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TenorCategories(searchTerm: $searchTerm, image: $image, name: $name)';
  }

  @override
  List<Object?> get props => [searchTerm, path, image, name];
}
