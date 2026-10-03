import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

AppBar buildAppBar(BuildContext context, [String? text]) {
  return AppBar(
    leading: IconButton(
      onPressed: () {
        if (context.canPop()) {
          context.pop();
        }
      },
      icon: Icon(Icons.arrow_back_ios, size: 20),
    ),
    title: text != null ? Text(text) : null,
  );
}
