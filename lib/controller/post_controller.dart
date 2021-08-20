import 'package:flutter_blog/domain/post/post.dart';
import 'package:flutter_blog/domain/post/post_repository.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  final PostRepository _postRepository = PostRepository();
  final posts = <Post>[].obs;

  /* obs : 값이 변경되면 실시간 반영(관찰)*/
  final post = Post().obs;

  @override
  void onInit() {
    super.onInit();
    findAll();
  }

  Future<void> findAll() async {
    List<Post> posts = await _postRepository.findAll();
    this.posts.value = posts;
  }

  Future<void> findById(int id) async {
    Post post = await _postRepository.findById(id);
    this.post.value = post;
  }

  Future<void> deleteById(int id) async {
    int result = await _postRepository.deleteById(id);
    if (result == 1) {
      print("서버쪽 삭제 성공");
    }
  }
}
