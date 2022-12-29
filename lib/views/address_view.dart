import 'package:collaborator_app/views/widgets/select_address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../controller/address_controller.dart';

class AddressView extends StatelessWidget {
  const AddressView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController provinceController = TextEditingController();
    TextEditingController districtController = TextEditingController();
    TextEditingController wardController = TextEditingController();
    TextEditingController villageController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SelectAddress(
                provinceController: provinceController,
                districtController: districtController,
                wardController: wardController,
                villageController: villageController,
              ),
              const SizedBox(height: 40),
              GetBuilder<AddressController>(builder: (addressController) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueAccent),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (provinceController.text.trim().isEmpty) {
                          Get.snackbar(
                              AppLocalizations.of(context)!
                                  .notSelectProvinceOne,
                              AppLocalizations.of(context)!
                                  .notSelectProvinceTwo,
                              backgroundColor: Colors.red,
                              colorText: Colors.white);
                        } else if (districtController.text.trim().isEmpty) {
                          Get.snackbar(
                              AppLocalizations.of(context)!
                                  .notSelectDistrictOne,
                              AppLocalizations.of(context)!
                                  .notSelectDistrictTwo,
                              backgroundColor: Colors.red,
                              colorText: Colors.white);
                        } else if (wardController.text.trim().isEmpty) {
                          Get.snackbar(
                              AppLocalizations.of(context)!.notSelectWardOne,
                              AppLocalizations.of(context)!.notSelectWardTwo,
                              backgroundColor: Colors.red,
                              colorText: Colors.white);
                        } else if (villageController.text.trim().isEmpty) {
                          Get.snackbar(
                              AppLocalizations.of(context)!.notSelectVillageOne,
                              AppLocalizations.of(context)!.notSelectVillageOne,
                              backgroundColor: Colors.red,
                              colorText: Colors.white);
                        } else if (addressController.provinceType == null) {
                          Get.snackbar(
                            AppLocalizations.of(context)!.errSelectProvinceOne,
                            AppLocalizations.of(context)!.errSelectProvinceTwo,
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                          );
                          provinceController.text = "";
                          districtController.text = "";
                          wardController.text = "";
                          villageController.text = "";
                          addressController.isEnableDistrictText = false;
                          addressController.isEnableWardText = false;
                          addressController.isEnableVillageText = false;
                        } else if (addressController.districtType == null) {
                          Get.snackbar(
                            AppLocalizations.of(context)!.errSelectDistrictOne,
                            AppLocalizations.of(context)!.errSelectDistrictTwo,
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                          );
                          districtController.text = "";
                          wardController.text = "";
                          villageController.text = "";
                          addressController.isEnableWardText = false;
                          addressController.isEnableVillageText = false;
                        } else if (addressController.wardType == null) {
                          Get.snackbar(
                            AppLocalizations.of(context)!.errSelectWardOne,
                            AppLocalizations.of(context)!.errSelectWardTwo,
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                          );
                          wardController.text = "";
                          villageController.text = "";
                          addressController.isEnableVillageText = false;
                        } else {
                          String addressString = "${villageController.text}, "
                              "${addressController.wardType} ${wardController.text}, "
                              "${addressController.districtType} ${districtController.text}, "
                              "${addressController.provinceType} ${provinceController.text}";
                          print("Address is:  + $addressString");
                        }
                      },
                      child: Text(AppLocalizations.of(context)!.agreeButton),
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
