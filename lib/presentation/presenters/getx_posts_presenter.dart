import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:intl/intl.dart';

import '../../domain/helpers/helpers.dart';
import '../../domain/usecases/usecases.dart';
import '../../ui/helpers/errors/errors.dart';
import '../../ui/pages/posts/post_view_model.dart';
import '../../ui/pages/posts/posts_presenter.dart';

class GetxPostsPresenter implements PostsPresenter {
  final LoadPosts loadPosts;
 
  final _posts = Rx<List<PostViewModel>>([]);
 final _navigateTo = RxString('');
 
  @override
  Stream<List<PostViewModel>> get loadPostsStream => _posts.stream;
    Stream<String>  get navigateToStream => _navigateTo.stream;
  GetxPostsPresenter({@required this.loadPosts});

  @override
  Future<void> loadData() async {

    try {
      final posts = await loadPosts.load();

      _posts.value = posts.map((post) => PostViewModel(
              id: post.id,
              description: post.description,
              likes: post.likes,
              comments: post.comments,
              created: DateFormat('dd MMM yyy').format(post.created),
              pics: post.pics,
            ),
          )
          .toList();
    } on DomainError catch(error){
      _posts.subject.addError(UIError.unexpected.description);
    } 
  }

  void goToComments(String postId){
     _navigateTo.subject.add('/comments/$postId') ;
   }
}
