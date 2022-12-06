import 'package:get/get_connect/http/src/response/response.dart';

import '../../config/app_constants.dart';
import '../model/product.dart';
import '../provider/api/api_server.dart';
import '../provider/db/storage_database.dart';

class ProductRepo {
  final ApiServer apiServer;

  ProductRepo({required this.apiServer});
  Future<Response> getProducts({Map<String, dynamic>? pageQuery}) async {
    return await apiServer.getData(AppConstants.getProducts, query: pageQuery);
  }

  Future<void> createProductToDB({List<Product>? products}) async {
    for (int i = 0; i < products!.length; i++) {
      if (products[i] is Product) {
        Product? product;
        product = await readProductByIDFromDB(id: products[i].id);
        if (product == null) {
          await StorageDatabase.instance.createProductToDB(products[i]);
        }
      }
    }
  }

  Future<Product?> readProductByIDFromDB({int? id}) async {
    Product? product = await StorageDatabase.instance.readProductByIDFromDB(id);
    return product;
  }

  Future<List<Product>?> readAllProductFromDB() async {
    List<Product>? products = [];
    products = await StorageDatabase.instance.readAllProductFromDB();
    return products;
  }
}
