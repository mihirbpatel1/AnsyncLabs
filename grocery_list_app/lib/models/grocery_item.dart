import 'package:json_annotation/json_annotation.dart';

part 'grocery_item.g.dart';

@JsonSerializable()
class GroceryItem {
  final String id;
  final String name;

  GroceryItem({required this.id, required this.name});

  factory GroceryItem.fromJson(Map<String, dynamic> json) =>
      _$GroceryItemFromJson(json);
  Map<String, dynamic> toJson() => _$GroceryItemToJson(this);

  GroceryItem copyWith({
    String? id,
    String? name,
  }) {
    return GroceryItem(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  String toString() => name;
}
