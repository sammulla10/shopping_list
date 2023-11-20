// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryAdapter extends TypeAdapter<Category> {
  @override
  final int typeId = 2;

  @override
  Category read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Category(
      fields[0] as String,
      fields[1] as Color,
      fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Category obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.color)
      ..writeByte(2)
      ..write(obj.img);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CategoriesAdapter extends TypeAdapter<Categories> {
  @override
  final int typeId = 3;

  @override
  Categories read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Categories.vegetables;
      case 1:
        return Categories.fruit;
      case 2:
        return Categories.meat;
      case 3:
        return Categories.dairy;
      case 4:
        return Categories.carbs;
      case 5:
        return Categories.sweets;
      case 6:
        return Categories.spices;
      case 7:
        return Categories.convenience;
      case 8:
        return Categories.hygiene;
      case 9:
        return Categories.other;
      default:
        return Categories.vegetables;
    }
  }

  @override
  void write(BinaryWriter writer, Categories obj) {
    switch (obj) {
      case Categories.vegetables:
        writer.writeByte(0);
        break;
      case Categories.fruit:
        writer.writeByte(1);
        break;
      case Categories.meat:
        writer.writeByte(2);
        break;
      case Categories.dairy:
        writer.writeByte(3);
        break;
      case Categories.carbs:
        writer.writeByte(4);
        break;
      case Categories.sweets:
        writer.writeByte(5);
        break;
      case Categories.spices:
        writer.writeByte(6);
        break;
      case Categories.convenience:
        writer.writeByte(7);
        break;
      case Categories.hygiene:
        writer.writeByte(8);
        break;
      case Categories.other:
        writer.writeByte(9);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoriesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
