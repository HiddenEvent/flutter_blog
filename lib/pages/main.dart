import 'package:flutter/material.dart';
import 'package:flutter_blog/pages/post/home_page.dart';
import 'package:flutter_blog/pages/user/join_page.dart';
import 'package:flutter_blog/pages/user/login_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(  /* getX 를 사용하기위해 GetMaterialApp로 감싸줘야한다. */
      debugShowCheckedModeBanner: false,
      // 라우트 설계 필요없음. GetX 사용 예정
      home: LoginPage(),
    );
  }
}
