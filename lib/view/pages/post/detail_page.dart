import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_blog/controller/post_controller.dart';
import 'package:flutter_blog/controller/user_controller.dart';
import 'package:flutter_blog/view/pages/post/update_page.dart';
import 'package:get/get.dart';

import 'home_page.dart';

class DetailPage extends StatelessWidget {
  final int? id;

  const DetailPage(this.id);

  @override
  Widget build(BuildContext context) {
    // String data = Get.arguments; => Getx를 통해 테이터를 받을 떄 사용
    UserController userC = Get.find();
    PostController postC = Get.find();
    print("로그인 유저아이디 : ${userC.principal.value.id}");

    return Scaffold(
      appBar: AppBar(title: Text("게시글 아이디: $id, 로그인 상태 : ${userC.isLogin}")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "${postC.post.value.title}",
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
                  child: Text("${postC.post.value.content}"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
