import '/domain/entities/entities.dart';
import 'post_view_model.dart';

abstract class PostsPresenter{

  Stream <bool> get isLoadingStream;
  Stream <List<PostViewModel>> get loadPostsStream;


  Future<void>loadData();
}