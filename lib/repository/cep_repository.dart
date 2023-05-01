import 'package:get/get.dart';
import 'package:get_state_manager/models/cep_model.dart';

class CepRepository extends GetConnect {
  Future<CepModel> findCep(String cep) async {
    final result = await get('http://viacep.com.br/ws/$cep/json/');

    return CepModel.fromMap(result.body);
  }
}
