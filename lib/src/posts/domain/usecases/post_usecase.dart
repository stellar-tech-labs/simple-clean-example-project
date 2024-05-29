import 'package:get_api/src/posts/data/models/post_model.dart';
import 'package:get_api/src/posts/domain/repository/post_repository.dart';

class PostUsecase {
  final PostRepository _postRepository;
  PostUsecase(this._postRepository);
  Future<List<PostModel>> fetchPosts() async {
    return _postRepository.fetchPosts();
  }
}
