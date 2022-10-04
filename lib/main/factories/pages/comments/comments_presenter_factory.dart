

import '../../../../presentation/presenters/getx_comments_presenter.dart';
import '../../../../ui/pages/comments/comments_presenter.dart';
import '../../usecases/load_comments_factory.dart';
import '../../usecases/save_comments_factory.dart';

CommentsPresenter makeGetxCommentsPresenter(String postId) {
  return GetxCommentsPresenter(
    loadComments: makeRemoteLoadComments(postId), postId: postId, saveComment: makeRemoteSaveComments(postId),
  );
}
