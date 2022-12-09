import 'package:collaborator_app/config/app_constants.dart';
import 'package:collaborator_app/data/model/user.dart';
import 'package:collaborator_app/data/provider/api/api_client.dart';
import 'package:get/get_connect/connect.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo{
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({required this.apiClient, required this.sharedPreferences});
  Future<Response> signUp(User signUpBody) async{
    return await apiClient.postData(AppConstants.USER_URL, signUpBody.toJson());
  }
  Future<Response> login(String userName, String password) async{
    return await apiClient.postData(AppConstants.LOGIN_URL, {"username" : userName, "password": password});
  }
  Future<bool> saveUserName(String id) async {
    return await sharedPreferences.setString(AppConstants.ID_USER,id);
  }
  Future<bool> saveUserToken(String token)async{
    apiClient.token = token;
    // apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }
  Future<void> saveUserNameAndPassword(String userName, String password)async{
    try {
      await sharedPreferences.setString(AppConstants.USER_NAME, userName);
      await sharedPreferences.setString(AppConstants.PASSWORD, password);
    } catch (e) {
      rethrow;
    }
  }
}