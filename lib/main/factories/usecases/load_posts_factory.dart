
import '../../../data/usecases/load_posts/load_posts.dart';
import '../../../data/usecases/usecases.dart';
import '../../../domain/usecases/usecases.dart';
import '../factories.dart';
import '../http/authorize_http_client_decorator_factory.dart';

LoadPosts makeRemoteLoadPosts() => RemoteLoadPosts(httpClient: makeAuthorizeHttpClientDecorator(), url: makeApiUrl('posts'));
