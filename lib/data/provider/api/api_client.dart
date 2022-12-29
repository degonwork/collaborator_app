import 'package:collaborator_app/config/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient extends GetConnect {
  late String token;
  final String baseurl;
  final SharedPreferences sharedPreferences;
  late Map<String, String>? header;
  ApiClient({required this.baseurl, required this.sharedPreferences}) {
    baseUrl = baseUrl;
    timeout = const Duration(seconds: 30);
    defaultContentType = 'application/json; charset=utf-8';
    token = sharedPreferences.getString(AppConstants.token) ?? "";
    // _mainHeader = {
    //   // 'Content-Type':'application/json; charset=UTF -8',
    //   // 'Authorization':'Bearer $token',
    // };
  }
//   void updateHeader(String token){
//   _mainHeader = {
//     'Content-Type': 'application/json; charset=UTF-8',
//     'Authorization': 'Bearer $token',
//   };
// }
// request to get data
  Future<Response> getData(String uri,
      {Map<String, dynamic>? query, Map<String, String>? headers}) async {
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
      // Response response = await get(uri,headers: headers,query:query );
      Response response = Response(
        statusCode: 200,
        statusText: "OK",
        body: dummyBody,
      );
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

// resquest post to create resource
  Future<Response> postData(String uri, dynamic body) async {
    try {
      Response response = await post(uri, body, headers: header);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

// request put to replace a resource or create a new resource if doesn't exits
  Future<Response> putData(
      String uri, dynamic body, Map<String, String> headers) async {
    try {
      Response response = await put(uri, body, headers: headers);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

// request to delete a resource
  Future<Response> deleteData(String uri) async {
    try {
      Response response = await delete(uri);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
