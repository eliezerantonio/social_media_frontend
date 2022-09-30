import 'comment_view_model.dart';

abstract class CommentsPresenter{
  Stream <List<CommentViewModel>> get loadCommentsStream;


  Future<void>loadData();
}