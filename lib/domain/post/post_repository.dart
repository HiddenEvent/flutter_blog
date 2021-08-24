import 'package:flutter_blog/controller/dto/CMRespDto.dart';
import 'package:flutter_blog/controller/dto/LoginReqDto.dart';
import 'package:flutter_blog/controller/dto/PostUpdateReqDto.dart';
import 'package:flutter_blog/domain/post/post.dart';
import 'package:flutter_blog/domain/post/post_provider.dart';
import 'package:flutter_blog/domain/user/user_provider.dart';
import 'package:flutter_blog/util/convert_utf8.dart';
import 'package:get/get.dart';

// 통신을 호출해서 응답되는 데이터를 예쁘게 가공!! == json => Dart 오브젝트
class PostRepository {
  final PostProvider _postProvider = PostProvider();

  Future<List<Post>> findAll() async {
    Response resp = await _postProvider.findAll();
    dynamic body = resp.body;
    // dynamic convertBody = convertUtf8ToObject(body); // UTF-8 한글 깨짐 해결
    CMRespDto cmRespDto = CMRespDto.fromJson(body);
    print(cmRespDto.code);
    print(cmRespDto.msg);
    print(cmRespDto.data.runtimeType);
    if (cmRespDto.code == 1) {
      List<dynamic> temp = cmRespDto.data;
      List<Post> posts = temp.map((post) => Post.fromJson(post)).toList();
      // print(posts.length);
      // print(posts[0].title);
      return posts;
    } else {
      // List<Post> hellow = [];
      return <Post>[];
    }
  }

  Future<Post> findById(int id) async {
    Response response = await _postProvider.findById(id);

    dynamic body = response.body;
    CMRespDto cmRespDto = CMRespDto.fromJson(body);
    if (cmRespDto.code == 1) {
      Post post = Post.fromJson(cmRespDto.data);
      return post;
    } else {
      return Post();
    }
  }

  Future<int> deleteById(int id) async {
    Response resp = await _postProvider.deleteById(id);
    dynamic body = resp.body;

    CMRespDto cmRespDto = CMRespDto.fromJson(body);
    return cmRespDto.code ?? -1;
  }

  Future<Post> updateById(int postId, String title, String content) async {
    PostUpdateReqDto postUpdateReqDto = PostUpdateReqDto(title, content);
    Response response = await _postProvider.updateById(postId, postUpdateReqDto.toJson());
    dynamic body = response.body;
    CMRespDto cmRespDto = CMRespDto.fromJson(body);
    if(cmRespDto.code == 1) {
      Post post = Post.fromJson(cmRespDto.data);
      return post;
    } else {
      return Post();
    }
  }

}