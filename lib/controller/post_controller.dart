import 'package:flutter_blog/domain/post/post_repository.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class PostController extends GetxController {

  final PostRepository _postRepository = PostRepository();

  void findAll() {
    _postRepository.findAll();
  }

}