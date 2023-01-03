import 'dart:io';

import 'package:collaborator_app/config/ui_constants.dart';
import 'package:collaborator_app/controller/auth_controller.dart';
import 'package:collaborator_app/controller/user_controller.dart';
import 'package:collaborator_app/views/widgets/profile_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    AuthController authController = Get.find();
    UserController userController = Get.find();
    
    return Scaffold(
      body: Column(
          children: [
            Container(
              // margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
              padding:  const EdgeInsets.only(top: 100),
              height: 150,
              width: 300,
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  GestureDetector(
                    onTap: () => {userController.getImage()},
                    child: GetBuilder<UserController>(
                      builder:(userController) => Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: userController.image == null ? const AssetImage('assets/images/avatar.png')as ImageProvider : FileImage(userController.image!),fit: BoxFit.cover),
                          border: Border.all(width: 80),
                          borderRadius:const BorderRadius.all(Radius.circular(80)),
                        ),
                        
                    
                      ),
                    ),
                  ),
          //  const  CircleAvatar(
          //           radius: 25,
          //           backgroundImage: AssetImage('assets/images/avatar.png'),
                    
          //         ),
                  Align(
                    widthFactor: 25,
                    heightFactor: 25,
                    child: Container(
                      padding: const EdgeInsets.only(left: 50.0,top: 15),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          LineAwesomeIcons.pen,
                          color: kDarkPrimaryColor,
                          size: 15.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
      const SizedBox( height: 10),      
      const Text('name'),
            Expanded(
                child: ListView(
              children: [
                const ProfileListItem(
                  text: "Privacy",
                  icon: LineAwesomeIcons.user_shield,
                ),
                const ProfileListItem(
                  text: "History",
                  icon: LineAwesomeIcons.history,
                ),
                const ProfileListItem(
                  text: "Support",
                  icon: LineAwesomeIcons.question_circle,
                ),
                const ProfileListItem(
                  text: "Settings",
                  icon: LineAwesomeIcons.cog,
                ),
                const ProfileListItem(
                  text: "Invite friend",
                  icon: LineAwesomeIcons.user_plus,
                ),
                ProfileListItem(
                    text: "Logout",
                    icon: LineAwesomeIcons.alternate_sign_out,
                    onTap: () {
                      authController.logOut();
                      // Get.offAllNamed("/login");
                    }),
              ],
            )),
          ],
        ),
      // body: GetBuilder<AuthController>(
        // builder: (authController) => Column(
        //   children: [
        //     Container(
        //       margin: const EdgeInsets.only(top: 80, left: 30, right: 30),
        //       padding:  const EdgeInsets.only(top: 100),
        //       height: 150,
        //       width: 300,
        //       child: Stack(
        //         alignment: AlignmentDirectional.topCenter,
        //         children: [
        //    const  CircleAvatar(
        //             radius: 50,
        //             backgroundImage: AssetImage('assets/images/avatar.png'),
        //           ),
        //           Align(
        //             widthFactor: 25,
        //             heightFactor: 25,
        //             child: Container(
        //               padding: const EdgeInsets.only(left: 90.0),
        //               decoration: const BoxDecoration(
        //                 shape: BoxShape.circle,
        //               ),
        //               child: const Center(
        //                 child: Icon(
        //                   LineAwesomeIcons.pen,
        //                   color: kDarkPrimaryColor,
        //                   size: 15.0,
        //                 ),
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //     const Text('name'),
        //     Expanded(
        //         child: ListView(
        //       children: [
        //         const ProfileListItem(
        //           text: "Privacy",
        //           icon: LineAwesomeIcons.user_shield,
        //         ),
        //         const ProfileListItem(
        //           text: "History",
        //           icon: LineAwesomeIcons.history,
        //         ),
        //         const ProfileListItem(
        //           text: "Support",
        //           icon: LineAwesomeIcons.question_circle,
        //         ),
        //         const ProfileListItem(
        //           text: "Settings",
        //           icon: LineAwesomeIcons.cog,
        //         ),
        //         const ProfileListItem(
        //           text: "Invite friend",
        //           icon: LineAwesomeIcons.user_plus,
        //         ),
        //         ProfileListItem(
        //             text: "Logout",
        //             icon: LineAwesomeIcons.alternate_sign_out,
        //             onTap: () {
        //               authController.logOut();
        //               Get.offAllNamed("/login");
        //             }),
        //       ],
        //     )),
        //   ],
        // ),
      // ),
    );
  }
}
