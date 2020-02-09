// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BaseinfoAdapter extends TypeAdapter<Baseinfo> {
  @override
  final typeId = 0;

  @override
  Baseinfo read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Baseinfo(
      fields[0] as DateTime,
      fields[1] as double,
      fields[2] as double,
      fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Baseinfo obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.currentDate)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.volume)
      ..writeByte(3)
      ..write(obj.distance);
  }
}
