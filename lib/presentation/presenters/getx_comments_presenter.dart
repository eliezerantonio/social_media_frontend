import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:social_media_front/domain/usecases/load_comments.dart';

import '../../domain/helpers/helpers.dart';
import '../../domain/usecases/save_comment.dart';
import '../../ui/helpers/errors/errors.dart';
import '../../ui/pages/comments/comment_view_model.dart';
import '../../ui/pages/comments/comments_presenter.dart';

class GetxCommentsPresenter implements CommentsPresenter {
  final LoadComments loadComments;
  final SaveComment saveComment;
  final String postId;

  String _description;
  final _comments = Rx<List<CommentViewModel>>([]);


  

  @override
  Stream<List<CommentViewModel>> get loadCommentsStream => _comments.stream;

  GetxCommentsPresenter(
      {@required this.loadComments,
      @required this.saveComment,
      @required this.postId});

  @override
  Future<void> loadData() async {
    try {
      final comments = await loadComments.load(postId);

      _comments.value = comments
          .map((comment) => CommentViewModel(
                id: comment.id,
                description: comment.description,
                postId: comment.postId,
                userId: comment.userId,
              ))
          .toList();
    } on DomainError {
      _comments.subject.addError(UIError.unexpected.description);
    }
  }

  @override
  Future<void> save() async {
    try {


      await saveComment.save(_description);
      loadData();
    } on DomainError {
    
    }
  }
@override
  void validateDescritpion(String description){

    _description=description;
  }
}
