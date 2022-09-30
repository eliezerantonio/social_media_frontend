import 'post_view_model.dart';

abstract class PostsPresenter{

 
  Stream <List<PostViewModel>> get loadPostsStream;

  Future<void>loadData();
}