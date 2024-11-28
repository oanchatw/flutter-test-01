import 'package:json_annotation/json_annotation.dart';

part 'cloths.g.dart';

@JsonSerializable()
class Cloth {
  int id;
  String title;
  int price;
  String description;
  List<String> images;
  DateTime creationAt;
  DateTime updatedAt;
  Category category;

  Cloth({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
    required this.creationAt,
    required this.updatedAt,
    required this.category,
  });

  factory Cloth.fromJson(Map<String, dynamic> json) => _$ClothFromJson(json);

  Map<String, dynamic> toJson() => _$ClothToJson(this);

  @override
  String toString() => toJson().toString();
}

@JsonSerializable()
class Category {
  int id;
  String name;
  String image;
  DateTime creationAt;
  DateTime updatedAt;

  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.creationAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  @override
  String toString() => toJson().toString();
}
