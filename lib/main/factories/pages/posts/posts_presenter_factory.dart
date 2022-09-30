

import '../../../../presentation/presenters/getx_posts_presenter.dart';
import '../../../../presentation/presenters/presenters.dart';
import '../../../../ui/pages/pages.dart';
import '../../../../ui/pages/posts/posts_presenter.dart';
import '../../factories.dart';
import '../../usecases/load_posts_factory.dart';

PostsPresenter makeGetxPostsPresenter() {
  return GetxPostsPresenter(
    loadPosts: makeRemoteLoadPosts(),
  );
}
