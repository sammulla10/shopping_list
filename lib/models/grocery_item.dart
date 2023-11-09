// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:shopping_list/models/category.dart';

class GroceryItem {
  final String? id;
  final String name;
  final int quantity;
  final Category category;

  GroceryItem({
    this.id,
    required this.name,
    required this.quantity,
    required this.category,
  });

  GroceryItem copyWith({
    String? id,
    String? name,
    int? quantity,
    Category? category,
  }) {
    return GroceryItem(
      id: id ?? this.id,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'quantity': quantity,
      'category': category.toMap(),
    };
  }

  factory GroceryItem.fromMap(Map<String, dynamic> map) {
    return GroceryItem(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] as String,
      quantity: map['quantity'] as int,
      category: Category.fromMap(map['category'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory GroceryItem.fromJson(String source) => GroceryItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GroceryItem(id: $id, name: $name, quantity: $quantity, category: $category)';
  }

  @override
  bool operator ==(covariant GroceryItem other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.quantity == quantity &&
      other.category == category;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      quantity.hashCode ^
      category.hashCode;
  }
}
