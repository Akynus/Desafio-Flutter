import 'package:challenge_flutter/src/blocs/request/request_event.dart';
import 'package:challenge_flutter/src/blocs/request/request_state.dart';
import 'package:challenge_flutter/src/models/request_model.dart';
import 'package:challenge_flutter/src/resources/providers/repository.dart';
import 'package:challenge_flutter/src/resources/translate.dart';
export 'package:challenge_flutter/src/blocs/request/request_event.dart';
export 'package:challenge_flutter/src/blocs/request/request_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestBloc extends Bloc<RequestEvent, RequestState> {
  RequestBloc() : super(RequestState());

  @override
  Stream<RequestState> mapEventToState(RequestEvent event) async* {
    final instance = event.runtimeType;
    switch (instance) {
      case RequestLoadingEvent:
        yield _loading();
        break;
      case RequestErrorEvent:
        var _event = event as RequestErrorEvent;
        yield _error(_event.message);
        break;
      case RequestDataEvent:
        var _event = event as RequestDataEvent;
        yield _loading();
        yield await _getData(_event.nfi);
        break;
      default:
        yield state;
        break;
    }
  }

  Future<RequestState> _getData(String nif) async {
    try {
      var repository = Repository();
      await Future.delayed(Duration(seconds: 1));
      var data = await repository.fetchRequestData(nif: nif);
      if (data.status == Status.ERROR) throw data.message ?? translate(Keys.error_connection);
      return RequestDataState(data);
    } catch (e) {
      return _error(e.toString());
    }
  }

  RequestErrorState _error(String message) {
    return RequestErrorState(message);
  }

  RequestLoadingState _loading() {
    return RequestLoadingState();
  }
}
