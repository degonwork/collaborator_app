import 'package:collaborator_app/data/provider/api/api_client.dart';
import 'package:collaborator_app/data/repository/auth_repo.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../config/app_constants.dart';
import '../controller/auth_controller.dart';
import '../controller/product_controller.dart';
import '../data/provider/api/api_ghtk.dart';
import '../data/provider/api/api_server.dart';
import '../data/repository/product_repo.dart';

Future<void> dependencies() async{
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences,fenix: true);
  Get.lazyPut(() => ApiClient(baseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));
  Get.lazyPut(() => ApiGHTK(baseUrlGHTK: AppConstants.baseUrlGHTK));
  Get.lazyPut(() => ApiServer(baseUrlSever: AppConstants.baseUrlSever));
  Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => ProductRepo(apiServer: Get.find()));
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => ProductController(productRepo: Get.find()));
}
