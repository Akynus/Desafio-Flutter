import 'package:equatable/equatable.dart';

class CompanyState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CompanyLoadingState extends CompanyState {}

class CompanySuccessState extends CompanyState {}

class CompanyErrorState extends CompanyState {
  final String message;

  CompanyErrorState(this.message);
}
