import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:med_card/core/colors/app_colors.dart';

Future<dynamic> signOutDialog(BuildContext context) {
  return showPlatformDialog(
    context: context,
    builder: (mycontext) => BasicDialogAlert(
      title: Text('Sign out?'),
      content: Text('Do you really wanna sign out'),
      actions: <Widget>[
        BasicDialogAction(
          title: Text(
            'Yes',
            style: TextStyle(color: AppColors.primary),
          ),
          onPressed: () {},
        ),
        BasicDialogAction(
          title: Text(
            'No',
            style: TextStyle(color: AppColors.primary),
          ),
          onPressed: () => Navigator.pop(mycontext),
        ),
      ],
    ),
  );
}
