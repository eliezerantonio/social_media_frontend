
import '../../../data/usecases/remote_save_comment/remote_save.comment.dart';
import '../../../domain/usecases/save_comment.dart';
import '../factories.dart';
import '../http/authorize_http_client_decorator_factory.dart';

SaveComment makeRemoteSaveComments(String postId) => RemoteSaveComment(httpClient: makeAuthorizeHttpClientDecorator(), url: makeApiUrl('comments/$postId'));
