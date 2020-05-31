import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:videoguysrinath/provider/user_provider.dart';
import 'package:videoguysrinath/utils/universal_variable.dart';
import 'package:videoguysrinath/utils/utilites.dart';
import 'package:videoguysrinath/widgets/user_detail_container.dart';

class UserCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);

    return GestureDetector
      ( onTap: () => showModalBottomSheet(context: context, backgroundColor: UniversalVariables.blackColor,
    builder: (context) => UserDetailsContainer(),
    isScrollControlled: true,
    ),
        child: Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: UniversalVariables.separatorColor,
      ),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text(
              Utils.getInitials(userProvider.getUser.name),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: UniversalVariables.lightBlueColor,
                fontSize: 13,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: UniversalVariables.blackColor, width: 2),
                  color: UniversalVariables.onlineDotColor),
            ),
          )
        ],
      ),
    ));
  }
}