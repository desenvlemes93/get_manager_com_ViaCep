import 'package:get/get.dart';
import 'package:get_state_manager/models/cep_model.dart';
import 'package:get_state_manager/repository/cep_repository.dart';

class HomeControllerStateMixin extends GetxController
    with StateMixin<CepModel> {
  final CepRepository cepRepository;
  final _cepSearch = ''.obs;

  HomeControllerStateMixin(this.cepRepository);
  set cepSearch(String cepSearch) => _cepSearch.value = cepSearch;
  @override
  void onReady() {
    change(state, status: RxStatus.empty());
  }

  Future<void> findAdress() async {
    change(state, status: RxStatus.loading());

    final _cepA = await cepRepository.findCep(_cepSearch.value);
    change(_cepA, status: RxStatus.success());
  }

  Future<void> findAdress2() async {
    append(
      () => () => cepRepository.findCep(_cepSearch.value),
    );
  }
}
