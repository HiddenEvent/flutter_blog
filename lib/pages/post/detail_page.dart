import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {

  final int id;

  const DetailPage(this.id);

  @override
  Widget build(BuildContext context) {
    // String data = Get.arguments; => Getx를 통해 테이터를 받을 떄 사용
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Detatil Page $id"),
      ),
    );
  }
}
