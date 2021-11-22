import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/screens/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      initialRoute: '/Home',
      getPages: [
        GetPage(name: '/Home', page: ()=> Home())
      ],
      //hello
    );
  }
}
