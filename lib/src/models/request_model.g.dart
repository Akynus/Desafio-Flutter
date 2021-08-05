// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestModel _$RequestModelFromJson(Map<String, dynamic> json) {
  return RequestModel(
    status: _$enumDecode(_$StatusEnumMap, json['status']),
    message: json['message'] as String?,
    nfi: json['cnpj'] as String?,
    type: _$enumDecodeNullable(_$TypeEnumMap, json['tipo']),
    opening: json['abertura'] as String?,
    name: json['nome'] as String?,
    nickname: json['fantasia'] as String?,
    mainActivities: (json['atividade_principal'] as List<dynamic>?)
        ?.map((e) => RequestActivityModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    altActivities: (json['atividades_secundarias'] as List<dynamic>?)
        ?.map((e) => RequestActivityModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    fiscalName: json['natureza_juridica'] as String?,
    address: json['logradouro'] as String?,
    number: json['numero'] as String?,
    complement: json['complemento'] as String?,
    cep: json['cep'] as String?,
    neighborhood: json['bairro'] as String?,
    city: json['municipio'] as String?,
    uf: json['uf'] as String?,
    email: json['emil'] as String?,
    phone: json['telefone'] as String?,
    efr: json['efr'] as String?,
    situation: json['situacao'] as String?,
    situationDate: json['data_situacao'] as String?,
    situationReason: json['motivo_situacao'] as String?,
    especialSituation: json['situacao_especial'] as String?,
    especialSituationDate: json['data_situacao_especial'] as String?,
    socialValue: json['capital_social'] as String?,
    partners: (json['qsa'] as List<dynamic>?)
        ?.map((e) => RequestPartnerModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$RequestModelToJson(RequestModel instance) {
  final val = <String, dynamic>{
    'status': _$StatusEnumMap[instance.status],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('message', instance.message);
  writeNotNull('cnpj', instance.nfi);
  writeNotNull('tipo', _$TypeEnumMap[instance.type]);
  writeNotNull('abertura', instance.opening);
  writeNotNull('nome', instance.name);
  writeNotNull('fantasia', instance.nickname);
  writeNotNull('atividade_principal', instance.mainActivities);
  writeNotNull('atividades_secundarias', instance.altActivities);
  writeNotNull('natureza_juridica', instance.fiscalName);
  writeNotNull('logradouro', instance.address);
  writeNotNull('numero', instance.number);
  writeNotNull('complemento', instance.complement);
  writeNotNull('cep', instance.cep);
  writeNotNull('bairro', instance.neighborhood);
  writeNotNull('municipio', instance.city);
  writeNotNull('uf', instance.uf);
  writeNotNull('emil', instance.email);
  writeNotNull('telefone', instance.phone);
  writeNotNull('efr', instance.efr);
  writeNotNull('situacao', instance.situation);
  writeNotNull('data_situacao', instance.situationDate);
  writeNotNull('motivo_situacao', instance.situationReason);
  writeNotNull('situacao_especial', instance.especialSituation);
  writeNotNull('data_situacao_especial', instance.especialSituationDate);
  writeNotNull('capital_social', instance.socialValue);
  writeNotNull('qsa', instance.partners);
  return val;
}

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$StatusEnumMap = {
  Status.OK: 'OK',
  Status.ERROR: 'ERROR',
};

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$TypeEnumMap = {
  Type.MATRIZ: 'MATRIZ',
  Type.FILIAL: 'FILIAL',
};

RequestActivityModel _$RequestActivityModelFromJson(Map<String, dynamic> json) {
  return RequestActivityModel(
    code: json['code'] as String?,
    description: json['text'] as String?,
  );
}

Map<String, dynamic> _$RequestActivityModelToJson(
    RequestActivityModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', instance.code);
  writeNotNull('text', instance.description);
  return val;
}

RequestPartnerModel _$RequestPartnerModelFromJson(Map<String, dynamic> json) {
  return RequestPartnerModel(
    name: json['nome'] as String?,
    type: json['qual'] as String?,
    originCountry: json['pais_origem'] as String?,
    legalName: json['nome_rep_legal'] as String?,
    legalType: json['qual_rep_legal'] as String?,
  );
}

Map<String, dynamic> _$RequestPartnerModelToJson(RequestPartnerModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('nome', instance.name);
  writeNotNull('qual', instance.type);
  writeNotNull('pais_origem', instance.originCountry);
  writeNotNull('nome_rep_legal', instance.legalName);
  writeNotNull('qual_rep_legal', instance.legalType);
  return val;
}
