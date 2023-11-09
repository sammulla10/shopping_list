// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/material.dart';

enum Categories{
 vegetables,
  fruit,
  meat,
  dairy,
  carbs,
  sweets,
  spices,
  convenience,
  hygiene,
  other
}

class Category {
  final String title;
  final Color color;

  const Category(
    this.title,
    this.color,
  );

  Category copyWith({
    String? title,
    Color? color,
  }) {
    return Category(
      title ?? this.title,
      color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'color': color.value,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      map['title'] as String,
      Color(map['color'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) => Category.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Category(title: $title, color: $color)';

  @override
  bool operator ==(covariant Category other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.color == color;
  }

  @override
  int get hashCode => title.hashCode ^ color.hashCode;
}
