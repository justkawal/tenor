part of tenor;

// ignore: must_be_immutable
class TenorCategories extends Equatable {
  String searchTerm;
  String path;
  String image;
  String name;
  TenorCategories({
    this.searchTerm,
    this.path,
    this.image,
    this.name,
  });

  TenorCategories copyWith({
    String searchTerm,
    String path,
    String image,
    String name,
  }) {
    return TenorCategories(
      searchTerm: searchTerm ?? this.searchTerm,
      path: path ?? this.path,
      image: image ?? this.image,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'searchterm': searchTerm,
      'image': image,
      'name': name,
    };
  }

  static TenorCategories fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
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
  List<Object> get props => [searchTerm, path, image, name];
}
