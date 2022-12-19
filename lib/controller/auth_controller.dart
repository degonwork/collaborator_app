import 'dart:convert';


import 'package:collaborator_app/data/repository/auth_repo.dart';
import 'package:collaborator_app/views/login_view.dart';
import 'package:crypto/crypto.dart';
import 'package:get/get.dart' hide Response;
import 'package:http/http.dart' ;
import 'package:shared_preferences/shared_preferences.dart';


class AuthController extends GetxController {
  final AuthRepo authRepo;
  AuthController({required this.authRepo});
  final  _isLoading = false;
  bool get isLoading => _isLoading;
  bool isObscure = true;
// Future<void> signUp(User signUpBody) async {
//   _isLoading = true;
//   update();
//   Response response = await authRepo.signUp(signUpBody);
//   // late ResponseModel responseModel;
//     if (response.statusCode == 200) {
//       print("Result register  ${response.body}");
//       authRepo.saveUserName(response.body['id'].toString());
//       // responseModel = ResponseModel(true, response.body['id'].toString());
//     } else {
//       // responseModel = ResponseModel(false, response.statusText!);
//     }
//     _isLoading = false;
//     update();
//     // return responseModel;
// }
Future<void> signUp(String email, String password) async {
  try {
    Response response = await post(Uri.parse('https://reqres.in/api/register'),body: {
      'email' : email,
      'password': password,
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      print(data['token']);
      print('account created success');
    } else {
      print('failed');
    }
  } catch (e) {
    // print(e.toString());
  }
}

Future<void> login(String email, String password) async {
  try {
    Response response = await post(Uri.parse('https://reqres.in/api/login'), body: {
      'email' : email,
      'password' : password,
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      print(data);
      print('Login Successfully');
    } else {
      print('failed');
    }
  } catch (e) {
    // print(e.toString());
  }
}
Future<void> logOut() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
  print(prefs.clear());
  Get.offAll(() => const LoginView());
}
Future<void> createInforUser(String userName, String job) async{
  try {
    Response response = await post(Uri.parse('https://reqres.in/api/user'), body: {
      "name" : userName,
      "job" : job,
    });
    if (response.statusCode == 201) {
      var data = jsonDecode(response.body);
      print(data);
    } else {
      print('failed');
    }
  } catch (e) {
    // print(e.toString());
  }
}
// Future<void> login(String userName, String password) async{
//   _isLoading = true;
//   update();
//   Response response = await authRepo.login(userName, password);
//   // late ResponseModel  responseModel;
//   if (response.statusCode == 200) {
//     authRepo.saveUserToken(response.body['token']);
//     print(response.body['token']);
//     saveUserNameAndPassword(userName, password);
//     // responseModel = ResponseModel(true, response.body['token']);
//   }else{
//     // responseModel = ResponseModel(false, response.statusText!);
//   }
//   _isLoading = false;
//   update();
//   // return responseModel;
  
// }
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
