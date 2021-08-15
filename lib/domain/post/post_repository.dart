import 'package:flutter_blog/controller/dto/LoginReqDto.dart';
import 'package:flutter_blog/domain/post/post_provider.dart';
import 'package:flutter_blog/domain/user/user_provider.dart';
import 'package:get/get.dart';

// 통신을 호출해서 응답되는 데이터를 예쁘게 가공!! == json => Dart 오브젝트
class PostRepository {
  final PostProvider _postProvider = PostProvider();

  Future<void> findAll() async {
    Response resp = await _postProvider.findAll();
    dynamic body = resp.body;
    print(body);
  }
}