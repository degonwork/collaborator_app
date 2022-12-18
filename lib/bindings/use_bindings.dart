import 'package:get/get.dart';
import '../controller/cart_controller.dart';
import '../controller/controller_view_controller.dart';
import '../controller/order_controller.dart';
import '../data/repository/cart_repo.dart';
import '../data/repository/order_repo.dart';

void dependencies() {
  Get.lazyPut(() => OrderRepo(apiGHTK: Get.find()), fenix: true);
  Get.lazyPut(() => CartRepo(), fenix: true);
  Get.lazyPut(
      () => OrderController(orderRepo: Get.find(), cartRepo: Get.find()));
  Get.lazyPut(() => CartController(
      cartRepo: Get.find(), productRepo: Get.find(), orderRepo: Get.find()));

  Get.lazyPut(() => ControlViewController());
}
