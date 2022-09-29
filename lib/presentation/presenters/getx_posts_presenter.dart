import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../domain/helpers/helpers.dart';
import '../../domain/usecases/usecases.dart';
import '../../ui/helpers/errors/errors.dart';
import '../../ui/pages/posts/post_view_model.dart';
import '/domain/entities/post_entity.dart';
import 'package:meta/meta.dart';
import '../../ui/pages/posts/posts_presenter.dart';

class GetxPostsPresenter implements PostsPresenter {
  final LoadPosts loadPosts;
  final _isLoading = true.obs;
  final _posts = Rx<List<PostViewModel>>([]);

  @override
  Stream<bool> get isLoadingStream => _isLoading.stream;
  @override
  Stream<List<PostViewModel>> get loadPostsStream => _posts.stream;

  GetxPostsPresenter({@required this.loadPosts});

  @override
  Future<void> loadData() async {
    try {
      _isLoading.value = true;
      final posts = await loadPosts.load();

      _posts.value = posts.map((post) => PostViewModel(
              id: post.id,
              description: post.description,
              likes: post.likes,
              created: DateFormat('dd MMM yyy').format(post.created),
              pics: post.pics,
            ),
          )
          .toList();
    } on DomainError {
      _posts.subject.addError(UIError.unexpected.description);
    } finally {
      _isLoading.value = false;
    }
  }
}
