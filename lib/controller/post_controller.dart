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
      /* 게시글 삭제 => where은 java에서 filter와 같다.*/
      List<Post> resultlist = posts.where((post) => post.id != id).toList();
      print(resultlist.length);
      
      /* posts 를 삭제후 다시 넣어주면 화면에서 Reload 된다 */
      posts.value = resultlist;
      
    }
  }
  Future<void> updateById(int id, String title, String content) async {
    Post post = await _postRepository.updateById(id, title, content);
    
    if(post.id != null){
      /* 1. 수정후 상세 페이지 값 변경*/
      this.post.value = post;
      /* 2. 리스트에 수정된 상세값 변경*/
      this.posts.value = this.posts.map((e) => e.id == id ? post : e).toList();
      
    }
    
  }


}
