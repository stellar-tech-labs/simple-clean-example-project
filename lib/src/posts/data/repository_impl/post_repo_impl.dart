import 'package:get_api/src/posts/data/datasources/post_remote_datasources.dart';
import 'package:get_api/src/posts/data/models/post_model.dart';
import 'package:get_api/src/posts/domain/repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource _postRemoteDataSource;
  PostRepositoryImpl(this._postRemoteDataSource);
  @override
  Future<List<PostModel>> fetchPosts() async {
    List<PostModel> postModel = [];
    try {
      final response = await _postRemoteDataSource.fetchPosts();
      postModel = response;
      return postModel;
    } catch (e) {
      return postModel;
    }
  }
}
