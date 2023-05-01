import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_state_manager/pages/home/home_controller_State_mixin.dart';

class HomePage extends StatelessWidget {
  final controller = Get.find<HomeControllerStateMixin>();
  HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(onChanged: (value) {
                controller.cepSearch = value;
              }),
              ElevatedButton(
                onPressed: () => controller.findAdress(),
                child: const Text('Buscar'),
              ),
              controller.obx(
                (state) => Text(state?.logradouro ?? ''),
              ),
              ElevatedButton(
                onPressed: () => controller.findAdress2(),
                child: const Text('Buscar com Append'),
              ),
              controller.obx(
                (state) => Text(state?.logradouro ?? ''),
              ),
              // Obx(() {
              //   return Visibility(
              //     visible: controller.loading,
              //     child: const Center(
              //       child: CircularProgressIndicator(),
              //     ),
              //   );
              // }),
              // Obx(
              //   () {
              //     return Visibility(
              //       visible: !controller.loading,
              //       child:
              //           Text(controller.cep?.logradouro ?? 'Não encontrado'),
              //     );
              //   },
              // )
            ],
          ),
        ),
      ),
    );
  }
}
