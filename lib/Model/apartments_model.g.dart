// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apartments_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ApartmentsAdapter extends TypeAdapter<Apartments> {
  @override
  final int typeId = 0;

  @override
  Apartments read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Apartments(
      address: fields[1] as String,
      amount: fields[0] as double,
      apartmentnumber: fields[2] as String,
      rented: fields[3] as bool,
      name: fields[4] as String?,
      months: fields[5] as double,
      paid: fields[6] as double?,
      restofpayment: fields[7] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, Apartments obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.amount)
      ..writeByte(1)
      ..write(obj.address)
      ..writeByte(2)
      ..write(obj.apartmentnumber)
      ..writeByte(3)
      ..write(obj.rented)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.months)
      ..writeByte(6)
      ..write(obj.paid)
      ..writeByte(7)
      ..write(obj.restofpayment);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApartmentsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
