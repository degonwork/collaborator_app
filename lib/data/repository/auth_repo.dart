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
    return await apiClient.postData(AppConstants.userUrl, signUpBody.toJson());
  }
  Future<Response> login(String userName, String password) async{
    return await apiClient.postData(AppConstants.loginUrl, {"username" : userName, "password": password});
  }
  Future<bool> saveUserName(String id) async {
    return await sharedPreferences.setString(AppConstants.idUser,id);
  }
  Future<bool> saveUserToken(String token)async{
    apiClient.token = token;
    // apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.token, token);
  }
  Future<void> saveUserNameAndPassword(String userName, String password)async{
    try {
      await sharedPreferences.setString(AppConstants.username, userName);
      await sharedPreferences.setString(AppConstants.password, password);
    } catch (e) {
      rethrow;
    }
  }
}