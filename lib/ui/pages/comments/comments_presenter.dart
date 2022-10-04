import '../../helpers/errors/ui_error.dart';
import 'comment_view_model.dart';

abstract class CommentsPresenter {
  Stream<List<CommentViewModel>> get loadCommentsStream;
  Future<void> loadData();
  Future<void> save();
  void validateDescritpion(String description);
}
