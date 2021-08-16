import 'package:flutter/material.dart';
import 'package:flutter_blog/controller/post_controller.dart';
import 'package:flutter_blog/controller/user_controller.dart';
import 'package:flutter_blog/size.dart';
import 'package:flutter_blog/view/pages/post/write_page.dart';
import 'package:flutter_blog/view/pages/user/login_page.dart';
import 'package:flutter_blog/view/pages/user/user_info_page.dart';
import 'package:get/get.dart';

import 'detail_page.dart';

class HomePage extends StatelessWidget {
  // put 없으면 만들고,  있으면 찾는다 (싱글턴으로 관리됨)
  final UserController _userController = Get.find();
  // 객체 생성(create), onInit() 함수 실행 initialize)
  final PostController _postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _navigation(context),
      appBar: AppBar(
        title: Text("${_userController.isLogin}"),
      ),
      body: Obx(
        () => ListView.separated(
          itemCount: _postController.posts.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Get.to(DetailPage(index), arguments: "arguments 넘길때 사용");
              },
              title: Text("${_postController.posts[index].title}"),
              leading: Text("${_postController.posts[index].id}"),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
        ),
      ),
    );
  }

  Widget _navigation(BuildContext context) {
    return Container(
      width: getDrawerWidth(context),
      height: double.infinity,
      color: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  Get.to(WritePage());
                },
                child: Text(
                  "글쓰기",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54),
                ),
              ),
              Divider(),
              TextButton(
                onPressed: () {
                  Get.to(UserInfoPage());
                },
                child: Text(
                  "회원정보보기",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54),
                ),
              ),
              Divider(),
              TextButton(
                onPressed: () {
                  _userController.logout();
                  Get.to(LoginPage());
                },
                child: Text(
                  "로그아웃",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54),
                ),
              ),
              Divider()
            ],
          ),
        ),
      ),
    );
  }
}
