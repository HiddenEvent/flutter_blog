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
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  /* 리프레쉬 하기위해 생성 */
  var scaffoldKey = GlobalKey<ScaffoldState>();

  // put 없으면 만들고,  있으면 찾는다 (싱글턴으로 관리됨)
  final UserController userC = Get.find();

  // 객체 생성(create), onInit() 함수 실행 initialize)
  final PostController postC = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(scaffoldKey.currentState!.isDrawerOpen){ /* 드로어가 열려있으면 */
            scaffoldKey.currentState!.openEndDrawer(); //드로어를 닫겠다
          } else {
            scaffoldKey.currentState!.openDrawer(); // 드로어를 열겠다.
          }
        },
        child: Icon(Icons.code),
      ),
      drawer: _navigation(context),
      appBar: AppBar(
        title: Text("${userC.isLogin}"),
      ),
      body: Obx(
        /* obx를 Db데이터로 리프레쉬 할수 없다. => getBuilder를 사용해서 DB값으로 리프레쉬 해야한다.*/
        () => RefreshIndicator(
          /* 리프레쉬 하기위한 위젯*/
          key: refreshKey,
          onRefresh: () async {
            await postC.findAll(); /* 리프레쉬 함수... 화면을 아래로 끌어내리면 리프래쉬됨*/
          },
          child: ListView.separated(
            itemCount: postC.posts.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () async {
                  await postC.findById(postC.posts[index].id!); /*await를 걸어줘야 기다렸다가 그려주게된다*/
                  Get.to(
                    () => DetailPage(postC.posts[index].id),
                    arguments: "arguments 넘길때 사용",
                  );
                },
                title: Text("${postC.posts[index].title}"),
                leading: Text("${postC.posts[index].id}"),
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
          ),
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
                  Navigator.pop(context); /* 화면을 이동하면서 Navigator를 닫는 작업 - 1방법*/
                  // scaffoldKey.currentState!.openEndDrawer(); /* 화면을 이동하면서 Navigator를 닫는 작업 - 2방법*/
                  Get.to(() => UserInfoPage());
                },
                child: Text(
                  "회원정보보기",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54),
                ),
              ),
              Divider(),
              TextButton(
                onPressed: () {
                  userC.logout();
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
