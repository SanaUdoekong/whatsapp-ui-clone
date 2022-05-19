import 'package:flutter/material.dart';
import 'package:whatsapp_clone/configs/colors.dart';
import 'package:whatsapp_clone/view/chats.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Whatsapp Clone',
      theme: ThemeData(
        primaryColor: AppColors.tealGreenDark,
        primaryColorLight: AppColors.tealGreenDark,
      ),
      home: const Chats(),
    );
  }
}
