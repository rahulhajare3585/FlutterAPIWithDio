// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offline_provider.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OfflineProviderAdapter extends TypeAdapter<OfflineProvider> {
  @override
  final int typeId = 0;

  @override
  OfflineProvider read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OfflineProvider(
      id: fields[0] as int,
      name: fields[1] as String,
      serviceIds: fields[2] as String,
      providerGroup: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, OfflineProvider obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.serviceIds)
      ..writeByte(3)
      ..write(obj.providerGroup);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OfflineProviderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
