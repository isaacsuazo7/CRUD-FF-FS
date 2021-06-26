// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Client _$ClientFromJson(Map<String, dynamic> json) {
  return Client(
    uid: json['uid'] as String,
    name: json['name'] as String,
    dateOfBirth: Client._fromJson(json['dateOfBirth'] as Timestamp),
    statusCivil:
        _$enumDecodeNullable(_$StatusCivilEnumMap, json['statusCivil']),
    active: json['active'] as bool,
  );
}

Map<String, dynamic> _$ClientToJson(Client instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'dateOfBirth': Client._toJson(instance.dateOfBirth),
      'statusCivil': _$StatusCivilEnumMap[instance.statusCivil],
      'active': instance.active,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$StatusCivilEnumMap = {
  StatusCivil.single: 'single',
  StatusCivil.married: 'married',
};
