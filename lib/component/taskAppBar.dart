import 'package:flutter/material.dart';
import 'package:macapps/style.dart';

import '../utility/utility.dart';

AppBar taskAppBar(context, profileData) {
  return AppBar(
    backgroundColor: colorGreen,
    flexibleSpace: Container(
      margin: EdgeInsets.fromLTRB(10, 40, 10, 0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 24,
            child: ClipOval(child: Icon(Icons.abc)),
          ),
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(profileData['lastName'], style: head6Text(colorWhite)),
              Text(
                profileData['email'],
                style: head6Text(colorWhite.withValues(alpha: 0.7)),
              ),
            ],
          ),
        ],
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/createdTask');
        },
        icon: Icon(Icons.add_circle_outline, size: 24, color: colorWhite),
      ),
      IconButton(
        onPressed: () async {
          await RemoveToken();
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/login',
            (route) => false,
          );
          // Navigator.pushNamed(context, predicate)
        },
        icon: Icon(Icons.login_outlined, size: 24, color: colorWhite),
      ),
    ],
  );
}
