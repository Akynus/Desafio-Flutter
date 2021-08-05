import 'package:json_annotation/json_annotation.dart';

part 'company_model.g.dart';

@JsonSerializable()
class CompanyModel {
  CompanyModel({
    required this.nfi,
    required this.type,
    required this.opening,
    required this.name,
    required this.nickname,
    this.mainActivities = const [],
    this.altActivities = const [],
    required this.fiscalName,
    required this.address,
    required this.number,
    this.complement,
    required this.cep,
    required this.neighborhood,
    required this.city,
    required this.uf,
    required this.email,
    required this.phone,
    this.efr,
    this.situationDate,
    this.situationReason,
    this.especialSituation,
    this.especialSituationDate,
    this.socialValue,
    this.partners = const [],
  });

  @JsonKey(name: "cnpj")
  String nfi;
  @JsonKey(name: "tipo")
  Type type;
  @JsonKey(name: "abertura")
  String opening;
  @JsonKey(name: "nome")
  String name;
  @JsonKey(name: "fantasia")
  String nickname;
  @JsonKey(name: "atividade_principal")
  List<CompanyActivityModel> mainActivities;
  @JsonKey(name: "atividades_secundarias")
  List<CompanyActivityModel> altActivities;
  @JsonKey(name: "natureza_juridica")
  String fiscalName;
  @JsonKey(name: "logradouro")
  String address;
  @JsonKey(name: "numero")
  String number;
  @JsonKey(name: "complemento")
  String? complement;
  @JsonKey(name: "cep")
  String cep;
  @JsonKey(name: "bairro")
  String neighborhood;
  @JsonKey(name: "municipio")
  String city;
  @JsonKey(name: "uf")
  String uf;
  @JsonKey(name: "emil")
  String email;
  @JsonKey(name: "telefone")
  String phone;
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
  List<CompanyPartnerModel> partners;

  factory CompanyModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyModelToJson(this);
}

class CompanyActivityModel {
  CompanyActivityModel({required this.code, required this.description});

  @JsonKey(name: "code")
  String code;
  @JsonKey(name: "text")
  String description;
}

class CompanyPartnerModel {}
