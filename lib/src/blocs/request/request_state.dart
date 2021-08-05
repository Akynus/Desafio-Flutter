import 'package:challenge_flutter/src/models/request_model.dart';
import 'package:equatable/equatable.dart';

class RequestState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RequestLoadingState extends RequestState {}

class RequestDataState extends RequestState {
  final RequestModel data;

  RequestDataState(this.data);
}

class RequestErrorState extends RequestState {
  final String message;

  RequestErrorState(this.message);
}
