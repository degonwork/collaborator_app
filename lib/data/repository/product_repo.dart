import 'package:collaborator_app/data/provider/api/api_client.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import '../../config/app_constants.dart';
import '../model/product.dart';
import '../provider/db/storage_database.dart';

class ProductRepo {
  final ApiClient apiClient;

  ProductRepo({required this.apiClient});
  Future<Response> getProducts({Map<String, dynamic>? pageQuery}) async {
    return await apiClient.getData(AppConstants.getProducts, query: pageQuery);
  }

  Future<void> createProductToDB({List<Product>? products}) async {
    for (int i = 0; i < products!.length; i++) {
        Product? product;
        product = await readProductByIDFromDB(id: products[i].id);
        if (product == null) {
          await StorageDatabase.instance.createProductToDB(products[i]);
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
