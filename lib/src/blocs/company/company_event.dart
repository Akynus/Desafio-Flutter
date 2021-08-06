import 'package:challenge_flutter/src/models/request_model.dart';
import 'package:equatable/equatable.dart';

class CompanyEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CompanyResetEvent extends CompanyEvent {}

class CompanySaveEvent extends CompanyEvent {
  final RequestModel object;

  CompanySaveEvent(this.object);
}

class CompanyErrorEvent extends CompanyEvent {
  final String message;

  CompanyErrorEvent(this.message);
}

class CompanyLoadingEvent extends CompanyEvent {}
