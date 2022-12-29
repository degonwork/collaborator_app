import 'package:get/get.dart';
import '../controller/address_controller.dart';
import '../data/repository/address_repo.dart';

Future<void> dependencies() async {
  Get.lazyPut(() => AddressRepo(), fenix: true);
  Get.lazyPut(() => AddressController(addressRepo: Get.find()));
}
