import 'package:flutter/material.dart';

AppBar buildAppBar({required BuildContext context, required String title}) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  );
}
