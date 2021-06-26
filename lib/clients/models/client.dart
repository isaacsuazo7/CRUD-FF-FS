import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'client.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: true)
class Client {
  String uid;
  String name;
  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  DateTime dateOfBirth;
  StatusCivil statusCivil;
  bool active;

  Client(
      {this.uid, this.name, this.dateOfBirth, this.statusCivil, this.active});

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);
  Map<String, dynamic> toJson() => _$ClientToJson(this);

  static DateTime _fromJson(Timestamp date) =>
      DateTime.fromMillisecondsSinceEpoch(date.millisecondsSinceEpoch);
  static Timestamp _toJson(DateTime time) => Timestamp.fromDate(time);
}

Map<StatusCivil, String> statusCivilTitleSpanish = {
  StatusCivil.married: 'Casado',
  StatusCivil.single: 'Soltero'
};

String statusCivilToString(StatusCivil statusCivil) =>
    statusCivil.toString().split('.').last;

StatusCivil statusCivilFromString(String value) {
  return StatusCivil.values.firstWhere(
      (e) => e.toString().split('.')[1].toUpperCase() == value.toUpperCase());
}

enum StatusCivil {
  @JsonValue("single")
  single,
  @JsonValue("married")
  married
}
