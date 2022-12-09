
import 'package:collaborator_app/config/ui_constants.dart';
import 'package:collaborator_app/views/widgets/profile_list_item.dart';
import 'package:flutter/material.dart';




import 'package:line_awesome_flutter/line_awesome_flutter.dart';


class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        // margin: EdgeInsets.only(top: size.height * 0.1),
        // padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
       
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 80, left: 30, right: 30),
              padding: EdgeInsets.only(top: 10),
              height:150,
              width: 300,
              // color: Colors.red,
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/avatar.png'),
                  ),
                  Align(
                    widthFactor: 25,
                    heightFactor: 25,
                    child: Container(
                      padding: EdgeInsets.only(left: 90.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                       
                      ),
                      child: const Center(
                        child: Icon(LineAwesomeIcons.pen,color: kDarkPrimaryColor,size: 15.0,),
                      ),
                    ),
                  ),
                ],
              ),
            ),
 const      Text("name"),
 const      SizedBox(height: 10,),
            Expanded(child: ListView(
                            children:const [
                ProfileListItem(text: "Privacy",icon: LineAwesomeIcons.user_shield,),
                ProfileListItem(text: "History",icon: LineAwesomeIcons.history,),
                ProfileListItem(text: "Support",icon: LineAwesomeIcons.question_circle,),
                ProfileListItem(text: "Settings",icon: LineAwesomeIcons.cog,),
                ProfileListItem(text: "Invite friend", icon: LineAwesomeIcons.user_plus,),
                ProfileListItem(text: "Logout", icon: LineAwesomeIcons.alternate_sign_out,),
              ],
            )),
        ],
      ),
     ),
    );
  }
}