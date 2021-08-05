import 'package:json_annotation/json_annotation.dart';

part 'request_model.g.dart';

enum Status { OK, ERROR }
enum Type { MATRIZ, FILIAL }

@JsonSerializable(includeIfNull: false)
class RequestModel {
  RequestModel({
    required this.status,
    this.message,
    this.nfi,
    this.type,
    this.opening,
    this.name,
    this.nickname,
    this.mainActivities,
    this.altActivities,
    this.fiscalName,
    this.address,
    this.number,
    this.complement,
    this.cep,
    this.neighborhood,
    this.city,
    this.uf,
    this.email,
    this.phone,
    this.efr,
    this.situation,
    this.situationDate,
    this.situationReason,
    this.especialSituation,
    this.especialSituationDate,
    this.socialValue,
    this.partner,
  });

  @JsonKey(name: "status")
  Status status;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "cnpj")
  String? nfi;
  @JsonKey(name: "tipo")
  Type? type;
  @JsonKey(name: "abertura")
  String? opening;
  @JsonKey(name: "nome")
  String? name;
  @JsonKey(name: "fantasia")
  String? nickname;
  @JsonKey(name: "atividade_principal")
  List<RequestActivityModel>? mainActivities;
  @JsonKey(name: "atividades_secundarias")
  List<RequestActivityModel>? altActivities;
  @JsonKey(name: "natureza_juridica")
  String? fiscalName;
  @JsonKey(name: "logradouro")
  String? address;
  @JsonKey(name: "numero")
  String? number;
  @JsonKey(name: "complemento")
  String? complement;
  @JsonKey(name: "cep")
  String? cep;
  @JsonKey(name: "bairro")
  String? neighborhood;
  @JsonKey(name: "municipio")
  String? city;
  @JsonKey(name: "uf")
  String? uf;
  @JsonKey(name: "emil")
  String? email;
  @JsonKey(name: "telefone")
  String? phone;
  @JsonKey(name: "efr")
  String? efr;
  @JsonKey(name: "situacao")
  String? situation;
  @JsonKey(name: "data_situacao")
  String? situationDate;
  @JsonKey(name: "motivo_situacao")
  String? situationReason;
  @JsonKey(name: "situacao_especial")
  String? especialSituation;
  @JsonKey(name: "data_situacao_especial")
  String? especialSituationDate;
  @JsonKey(name: "capital_social")
  String? socialValue;
  @JsonKey(name: "qsa")
  List<RequestPartnerModel>? partner;

  factory RequestModel.fromJson(Map<String, dynamic> json) => _$RequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestModelToJson(this);
}

@JsonSerializable(includeIfNull: false)
class RequestActivityModel {
  RequestActivityModel({this.code, this.description});

  @JsonKey(name: "code")
  String? code;
  @JsonKey(name: "text")
  String? description;

  factory RequestActivityModel.fromJson(Map<String, dynamic> json) => _$RequestActivityModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestActivityModelToJson(this);
}

@JsonSerializable(includeIfNull: false)
class RequestPartnerModel {
  RequestPartnerModel({
    this.name,
    this.type,
    this.originCountry,
    this.legalName,
    this.legalType,
  });

  @JsonKey(name: "nome")
  String? name;
  @JsonKey(name: "qual")
  String? type;
  @JsonKey(name: "pais_origem")
  String? originCountry;
  @JsonKey(name: "nome_rep_legal")
  String? legalName;
  @JsonKey(name: "qual_rep_legal")
  String? legalType;

  factory RequestPartnerModel.fromJson(Map<String, dynamic> json) => _$RequestPartnerModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestPartnerModelToJson(this);
}
