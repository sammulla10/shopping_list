
part of 'category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ColorAdapter extends TypeAdapter<Color> {
  @override
  final typeId = 221;

  @override
  Color read(BinaryReader reader) => Color(reader.readUint32());

  @override
  void write(BinaryWriter writer, Color obj) => writer.writeUint32(obj.value);
}