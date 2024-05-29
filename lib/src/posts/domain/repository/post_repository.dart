import 'package:get_api/src/posts/data/models/post_model.dart';

abstract class PostRepository {
  Future<List<PostModel>> fetchPosts();
}
