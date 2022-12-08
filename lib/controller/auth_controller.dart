import 'dart:convert';


import 'package:collaborator_app/data/model/user.dart';
import 'package:collaborator_app/data/repository/auth_repo.dart';
import 'package:crypto/crypto.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final AuthRepo authRepo;
  AuthController({required this.authRepo});
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool isObscure = true;
Future<void> signUp(User signUpBody) async {
  _isLoading = true;
  update();
  Response response = await authRepo.signUp(signUpBody);
  // late ResponseModel responseModel;
    if (response.statusCode == 200) {
      print("Result register" + response.body.toString());
      authRepo.saveUserName(response.body['id'].toString());
      // responseModel = ResponseModel(true, response.body['id'].toString());
    } else {
      // responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    // return responseModel;
}
Future<void> login(String userName, String password) async{
  _isLoading = true;
  update();
  Response response = await authRepo.login(userName, password);
  // late ResponseModel  responseModel;
  if (response.statusCode == 200) {
    authRepo.saveUserToken(response.body['token']);
    print(response.body['token']);
    saveUserNameAndPassword(userName, password);
    // responseModel = ResponseModel(true, response.body['token']);
  }else{
    // responseModel = ResponseModel(false, response.statusText!);
  }
  _isLoading = false;
  update();
  // return responseModel;
  
}
void saveUserNameAndPassword(String username, String password) {
    authRepo.saveUserNameAndPassword(username, password);
  }
  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  isObscureActive() {
    isObscure = !isObscure;
    update();

  }

}
