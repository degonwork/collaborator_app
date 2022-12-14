import 'package:collaborator_app/config/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ApiClient extends GetConnect {
  late String token;
  final String baseurl;
  final SharedPreferences sharedPreferences;
  late Map<String, String>? header;
  ApiClient({required this.baseurl, required this.sharedPreferences}){
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
Future<Response> getData(String uri, {Map<String, dynamic>? query, Map<String, String>? headers} ) async {
  try {
    Response response = await get(uri,headers: headers,query:query );
    return response;
  } catch (e) {
    return Response(statusCode: 1,statusText: e.toString());
  }
}
// resquest post to create resource
Future<Response> postData(String uri, dynamic body) async{
  try {
    Response response = await post(uri, body, headers: header);
    return response;
  } catch (e) {
    return Response(statusCode: 1, statusText: e.toString());
  }
}
// request put to replace a resource or create a new resource if doesn't exits
Future<Response> putData(String uri, dynamic body, Map<String, String> headers) async{
  try {
    Response response = await put(uri, body,headers: headers);
    return response;
  } catch (e) {
    return Response(statusCode: 1, statusText: e.toString());
  }
}
// request to delete a resource
Future<Response> deleteData(String uri) async{
  try {
    Response response = await delete(uri);
    return response;
  } catch (e) {
    return Response(statusCode: 1, statusText: e.toString());
  }
}

}