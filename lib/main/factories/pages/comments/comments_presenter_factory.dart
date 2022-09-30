

import '../../../../presentation/presenters/getx_comments_presenter.dart';
import '../../../../ui/pages/comments/comments_presenter.dart';
import '../../usecases/load_comments_factory.dart';

CommentsPresenter makeGetxCommentsPresenter() {
  return GetxCommentsPresenter(
    loadComments: makeRemoteLoadComments(),
  );
}
