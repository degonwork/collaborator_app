import 'package:collaborator_app/controller/auth_controller.dart';
import 'package:collaborator_app/routes/routes.dart';
// import 'package:collaborator_app/views/controller_view.dart';
// import 'package:collaborator_app/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/ui_constants.dart';

class CreateUserView extends StatefulWidget {
  const CreateUserView({super.key});

  @override
  State<CreateUserView> createState() => _CreateUserViewState();
}

class _CreateUserViewState extends State<CreateUserView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  final  _formKey = GlobalKey<FormState>();
  @override
  void dispose(){
   nameController.dispose();
   jobController.dispose();
   super.dispose();
  }
  AuthController authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 100),
            child: const Center(
              child: Text(
                'Thiết lập tài khoản của bạn',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 100),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          style: kTextFormFieldStyle(),
                          decoration: const InputDecoration(
                            prefixIcon:  Icon(Icons.person),
                            hintText: 'User Name',
                            border:  OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            ),
                          ),
                          controller: nameController,
                        ),
                const   SizedBox(height: 20,),
                        TextFormField(
                          style: kTextFormFieldStyle(),
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.percent),
                            hintText: 'Address',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                            ),
                          ),
                          controller: jobController,
                        ),
               const    SizedBox(height: 30,),
                        ElevatedButton(
                          onPressed: (){
                            authController.createInforUser(nameController.text,jobController.text);
                            Get.offAllNamed(Routes.getControlViewPage());
                          },
                          child: const Center(
                            child: Text('Hoàn thành'),
                          ),
                          )
                      ],
                    )
                    ),
          ),
        ],
      ),
    );
  }
}