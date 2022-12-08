import 'package:collaborator_app/config/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ApiClient extends GetConnect implements GetxService{
  late String token;
  final String baseUrl;
  final SharedPreferences sharedPreferences;
  late Map<String, String>? _mainHeader;
  ApiClient({required this.baseUrl, required this.sharedPreferences}){
    baseUrl = baseUrl;
    timeout = Duration(seconds: 30);
    token = sharedPreferences.getString(AppConstants.TOKEN) ?? "";
    _mainHeader = {
      // 'Content-Type':'application/json; charset=UTF -8',
      // 'Authorization':'Bearer $token',
    };
  }
//   void updateHeader(String token){
//   _mainHeader = {
//     'Content-Type': 'application/json; charset=UTF-8',
//     'Authorization': 'Bearer $token',
//   };
// }
Future<Response> getData(String uri, Map<String, String>? headers) async {
  try {
    Response response = await get(uri,headers: _mainHeader);
    return response;
  } catch (e) {
    print(e);
    return Response(statusCode: 1,statusText: e.toString());
  }
}
Future<Response> postData(String uri, dynamic body) async{
  try {
    Response response = await post(uri, body, headers: _mainHeader);
    return response;
  } catch (e) {
    return Response(statusCode: 1, statusText: e.toString());
  }
}
}