import 'package:get/get.dart';
import 'package:get_state_manager/repository/cep_repository.dart';

import '../../models/cep_model.dart';

class HomeController extends GetxController {
  final CepRepository cepRepository;

  final _cepSearch = ''.obs;
  final _cep = Rxn<CepModel>();

  final _loading = false.obs;
  HomeController(this.cepRepository);
  set cepSearch(String cepSearch) => _cepSearch.value = cepSearch;
  CepModel? get cep => _cep.value;

  bool get loading => _loading.value;

  Future<void> findAdress() async {
    _loading(true);
    final _cepA = await cepRepository.findCep(_cepSearch.value);
    _cep(_cepA);
    _loading(false);
  }
}
