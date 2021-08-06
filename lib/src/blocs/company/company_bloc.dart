import 'dart:convert';

import 'package:challenge_flutter/src/blocs/company/company_state.dart';
import 'package:challenge_flutter/src/blocs/company/company_event.dart';
import 'package:challenge_flutter/src/models/request_model.dart';
export 'package:challenge_flutter/src/blocs/company/company_state.dart';
export 'package:challenge_flutter/src/blocs/company/company_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
  CompanyBloc() : super(CompanyState());

  @override
  Stream<CompanyState> mapEventToState(CompanyEvent event) async* {
    final instance = event.runtimeType;
    switch (instance) {
      case CompanyResetEvent:
        yield _reset();
        break;
      case CompanySaveEvent:
        event as CompanySaveEvent;
        yield _loading();
        yield await _save(event.object);
        break;
      default:
        yield state;
        break;
    }
  }

  CompanyState _reset() {
    return CompanyState();
  }

  CompanyLoadingState _loading() {
    return CompanyLoadingState();
  }

  Future<CompanyState> _save(RequestModel object) async {
    try {
      await Future.delayed(Duration(seconds: 2));
      print(json.encode(object.toJson()));
      return CompanySuccessState();
    } catch (e) {
      return CompanyErrorState(e.toString());
    }
  }
}
