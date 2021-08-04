import 'package:json_annotation/json_annotation.dart';

part "company.g.dart";

@JsonSerializable()
class Company {
  Company({required this.name});

  @JsonKey(name: "nome")
  String name;
}
