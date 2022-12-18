import 'package:flutter/material.dart';


import 'package:line_awesome_flutter/line_awesome_flutter.dart';


import '../../config/ui_constants.dart';
class ProfileListItem extends StatelessWidget {
  final IconData? icon;
  final String text;
  final bool hasNavigation;
  const ProfileListItem({Key? key, this.icon, this.hasNavigation = true, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.symmetric(horizontal: 15),
      height: 55,
      margin: const EdgeInsets.symmetric(
        horizontal:15,
      ).copyWith(bottom:20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Theme.of(context).backgroundColor,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 35,
          ),
  const   SizedBox(width: 15,),
          Text(
            text,
            style: kTextTitleStyle.copyWith(fontWeight: FontWeight.w500),
          ),
  const   Spacer(),
          if(hasNavigation)
  const   Icon(LineAwesomeIcons.angle_right,
          size: 25,
          ),
        ],
      ),
    );

  }
}