// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'category.g.dart';
part 'color.g.dart';

@HiveType(typeId: 3)
enum Categories {
  @HiveField(0)
  vegetables,
  @HiveField(1)
  fruit,
  @HiveField(2)
  meat,
  @HiveField(3)
  dairy,
  @HiveField(4)
  carbs,
  @HiveField(5)
  sweets,
  @HiveField(6)
  spices,
  @HiveField(7)
  convenience,
  @HiveField(8)
  hygiene,
  @HiveField(9)
  other
}

@HiveType(typeId: 2)
class Category {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final Color color;
  @HiveField(2)
  final String img;

  const Category(
    this.title,
    this.color,
    this.img,
  );

  Category copyWith({
    String? title,
    Color? color,
    String? img,
  }) {
    return Category(
      title ?? this.title,
      color ?? this.color,
      img ?? this.img,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'color': color.value,
      'img': img,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      map['title'] as String,
      Color(map['color'] as int),
      map['img'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Category(title: $title, color: $color,img: $img)';

  @override
  bool operator ==(covariant Category other) {
    if (identical(this, other)) return true;

    return other.title == title && other.color == color && other.img == img;
  }

  @override
  int get hashCode => title.hashCode ^ color.hashCode ^ img.hashCode;
}
