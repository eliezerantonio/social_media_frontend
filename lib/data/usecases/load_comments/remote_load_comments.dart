import 'package:social_media_front/data/models/remote_comment_model.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/helpers/helpers.dart';
import '../../../domain/usecases/load_comments.dart';
import 'package:meta/meta.dart';

import '../../http/http.dart';
class RemoteLoadComments  implements LoadComments{
  RemoteLoadComments({@required this.url, @required this.httpClient});
  final String url;

  final HttpClient httpClient;

  @override
  Future<List<CommentEntity>> load(String id) async {
    try {

      final httpResponse = await httpClient.request(url: url, method: 'get', body:{'postId':id});

      return httpResponse['comments'].map<CommentEntity>((json) => RemoteCommentModel.fromJson(json).toEntity()).toList();
      
    } on HttpError catch (error) {
      
      throw error == HttpError.forbidden
          ? DomainError.accessDenied
          : DomainError.unexpected;
    }
  }

  
}

class RemoteLoadCommentsParams{
  final String postId;

  RemoteLoadCommentsParams(this.postId);

  factory RemoteLoadCommentsParams.fromDomain(LoadCommentsParams params) =>
    RemoteLoadCommentsParams(params.postId);

    Map toJson() => {'postId':postId};
  
}