import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_blog/view/pages/post/update_page.dart';

import 'package:get/get.dart';

import 'home_page.dart';

class DetailPage extends StatelessWidget {
  final int id;

  const DetailPage(this.id);

  @override
  Widget build(BuildContext context) {
    // String data = Get.arguments; => Getx를 통해 테이터를 받을 떄 사용
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "글 제목!!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
            ),
            Divider(),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.off(HomePage()); /* 뒤로가기 말고 새로 객체를 만들어서 이동해야한다. 나중에 상태관리로 뺴야하는 작업 */
                  },
                  child: Text("삭제"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.to(UpdatePage());
                  },
                  child: Text("수정"),
                ),
              ],
            ),
            Expanded(
              /* 글내용이 엄청 길 경우를 대비해야한다. (스크롤 용도)*/
              child: SingleChildScrollView(
                child: Text("글 내용 !!! " * 500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
