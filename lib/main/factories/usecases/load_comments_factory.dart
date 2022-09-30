
import '../../../data/usecases/load_comments/remote_load_comments.dart';
import '../../../data/usecases/load_posts/load_posts.dart';
import '../../../data/usecases/usecases.dart';
import '../../../domain/usecases/load_comments.dart';
import '../../../domain/usecases/usecases.dart';
import '../factories.dart';
import '../http/authorize_http_client_decorator_factory.dart';

LoadComments makeRemoteLoadComments(String postId) => RemoteLoadComments(httpClient: makeAuthorizeHttpClientDecorator(), url: makeApiUrl('comments/$postId'));
