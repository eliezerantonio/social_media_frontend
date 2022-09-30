import 'post_view_model.dart';

abstract class PostsPresenter{

 
  Stream <List<PostViewModel>> get loadPostsStream;
   Stream<String> get navigateToStream;

  Future<void>loadData();
   void goToComments(String postId);
}