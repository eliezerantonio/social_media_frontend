import 'package:meta/meta.dart';

import '../../domain/entities/entities.dart';
import '../http/http.dart';

class RemoteCommentModel {
  final String id;
  final String description;
  final String postId;
  final String userId;

  RemoteCommentModel(
      {@required this.id,
      @required this.description,
      @required this.postId,
      @required this.userId});

  factory RemoteCommentModel.fromJson(Map json) {
    if (!json.keys
        .toSet()
        .containsAll(['_id', 'description', 'postId', 'userId'])) {
      throw HttpError.invalidData;
    }

    return RemoteCommentModel(
        id: json['id'],
        description: json['description'],
        postId: json['postId'],
        userId: json['userId']);
  }

  CommentEntity toEntity() => CommentEntity(
      id: id, description: description, postId: postId, userId: userId);
}
