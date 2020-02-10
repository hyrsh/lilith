// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenance.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MaintenanceAdapter extends TypeAdapter<Maintenance> {
  @override
  final typeId = 1;

  @override
  Maintenance read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Maintenance(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Maintenance obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.plannedDate)
      ..writeByte(1)
      ..write(obj.atDistance)
      ..writeByte(2)
      ..write(obj.description);
  }
}
