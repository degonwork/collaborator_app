import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../controller/checkout_controller.dart';
import '../../routes/routes.dart';

class SelectTransport extends StatelessWidget {
  const SelectTransport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CheckOutController());
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          AppLocalizations.of(context)!.titleTransport,
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          GetBuilder<CheckOutController>(
            init: CheckOutController(),
            builder: (checkOutController) => Column(
              children: [
                Row(
                  children: [
                    Radio(
                      value: "economical",
                      groupValue: checkOutController.selectTransport,
                      onChanged: (value) {
                        checkOutController.onChangedTransport(value);
                      },
                    ),
                    Text(AppLocalizations.of(context)!.titleEconomicalDelivery)
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: "fast",
                      groupValue: checkOutController.selectTransport,
                      onChanged: (value) {
                        checkOutController.onChangedTransport(value);
                      },
                    ),
                    Text(AppLocalizations.of(context)!.titleFastDelivery)
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GetBuilder<CheckOutController>(
            builder: (checkOutController) => GestureDetector(
              onTap: () {
                if (checkOutController.selectTransport == null) {
                  Get.snackbar(
                    AppLocalizations.of(context)!.notSelectTransport,
                    AppLocalizations.of(context)!.selectTransport,
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                  );
                } else if (checkOutController.selectTransport == "economical") {
                  Get.toNamed(Routes.getSelectDeliveryPage());
                } else {
                  print("null");
                }
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Color(0xff00C569),
                ),
                child: Text(
                  AppLocalizations.of(context)!.nextButton,
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
