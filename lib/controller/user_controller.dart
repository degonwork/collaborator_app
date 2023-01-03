
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

class UserController extends GetxController{
   File? image;
   late String imagePath;
   final _picker = ImagePicker();
 Future<void> getImage() async {
  final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
  if (pickedFile != null) {
    image = File(pickedFile.path);
    imagePath = pickedFile.path;
    print(imagePath);
    update();
  } else {
    print('No image selected');
  }
 }
}