import 'package:flutter_translate_annotations/flutter_translate_annotations.dart';
export 'package:flutter_translate/flutter_translate.dart';

part 'translate.g.dart';

@TranslateKeysOptions(path: 'assets/i18n', caseStyle: CaseStyle.lowerCase, separator: "_")
class _$Keys {}
