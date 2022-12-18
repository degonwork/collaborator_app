import 'package:get/get.dart';

class ApiServer extends GetConnect implements GetxService {
  late String products;
  final String baseUrlSever;
  late Map<String, String> _mainHeader = {};
  ApiServer({required this.baseUrlSever}) {
    baseUrl = baseUrlSever;
    timeout = const Duration(seconds: 30);
    _mainHeader = {};
  }

  Future<Response> getData(String uri, {Map<String, dynamic>? query}) async {
    try {
      Map<String, dynamic> map1 = {
        "categories": [],
        "code": "4560147175291",
        "comments_count": 0,
        "created_at": "2022-11-25T03:25:50.059Z",
        "id": 189,
        "image_urls": [],
        "name": "MẶT NẠ TOFU Trắng",
        "price": 300000,
        "slug": "mat-na-tofu-trang",
        "stock": 8,
        "tags": [],
        "updated_at": "2022-11-25T03:25:50.059485Z",
        "weight": 50
      };
      Map<String, dynamic> map2 = {
        "categories": [],
        "code": "1928696535578",
        "comments_count": 0,
        "created_at": "2022-11-25T03:25:50.058Z",
        "id": 188,
        "image_urls": [],
        "name": "TDC ROSETTE XANH",
        "price": 125000,
        "slug": "tdc-rosette-xanh",
        "stock": 4,
        "tags": [],
        "updated_at": "2022-11-25T03:25:50.058005Z",
        "weight": 50
      };
      Map<String, dynamic> map3 = {
        "categories": [],
        "code": "4901696536407",
        "comments_count": 0,
        "created_at": "2022-11-25T03:25:50.056Z",
        "id": 187,
        "image_urls": [],
        "name": "TDC ROSETTE Đỏ",
        "price": 125000,
        "slug": "tdc-rosette-do",
        "stock": 18,
        "tags": [],
        "updated_at": "2022-11-25T03:25:50.056385Z",
        "weight": 50
      };
      Map<String, dynamic> map4 = {
        "categories": [],
        "code": "4571365221646",
        "comments_count": 0,
        "created_at": "2022-11-25T03:25:50.054Z",
        "id": 186,
        "image_urls": [],
        "name": "TDC Botanical",
        "price": 225000,
        "slug": "tdc-botanical",
        "stock": 5,
        "tags": [],
        "updated_at": "2022-11-25T03:25:50.054802Z",
        "weight": 50
      };
      List<Map> dummyBody = [map1, map2, map3, map4];
      // Response response = await get(uri, headers: _mainHeader, query: query);
      Response response = Response(
        statusCode: 200,
        statusText: "OK",
        body: dummyBody,
      );
      return response;
    } catch (e) {
      print(e);
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
