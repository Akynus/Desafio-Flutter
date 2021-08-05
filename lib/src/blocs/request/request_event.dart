import 'package:equatable/equatable.dart';

class RequestEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RequestDataEvent extends RequestEvent {
  final String nfi;

  RequestDataEvent(this.nfi);
}

class RequestErrorEvent extends RequestEvent {
  final String message;

  RequestErrorEvent(this.message);
}

class RequestLoadingEvent extends RequestEvent {}
