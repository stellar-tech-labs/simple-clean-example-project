import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_api/src/posts/data/models/post_model.dart';
import 'package:get_api/src/posts/domain/usecases/post_usecase.dart';

class PostCubit extends Cubit<List<PostModel>> {
  final PostUsecase _postUsecase;
  PostCubit(this._postUsecase) : super(<PostModel>[]) {
    fetchPosts();
  }

  fetchPosts() async {
    final posts = await _postUsecase.fetchPosts();
    emit(posts);
  }
}
