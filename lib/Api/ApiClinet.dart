import 'package:dio/dio.dart';
import 'package:mobile_bank_checkque/data/models/cheque.dart';

class ApiClinet {
  static final String _base_Url = "Example.com";
  final Dio _dio = Dio();

  Future<Cheque> getCheques({required String id}) async {
    Response chequeData = await _dio.get(_base_Url + id);
    return chequeData.data;
  }
}