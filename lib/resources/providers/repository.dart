import 'package:challenge_flutter/models/company.dart';
import 'package:challenge_flutter/resources/providers/company_api_provider.dart';

class Repository {
  final companyApiProvider = CompanyApiProvider();

  Future<Company?> fetchCompanyData({required String code}) => companyApiProvider.getData(code: code);
}
