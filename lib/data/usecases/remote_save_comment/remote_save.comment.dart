import 'package:flutter/material.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/helpers/helpers.dart';
import '../../../domain/usecases/save_comment.dart';
import '../../http/http.dart';
import '../../models/remote_comment_model.dart';

class RemoteSaveComment implements SaveComment {
  RemoteSaveComment({@required this.httpClient, @required this.url});

  HttpClient httpClient;
  String url;

  @override
  Future<CommentEntity> save(String description) async {
  

    try {
      final httpResponse = await httpClient.request(url: url, method: 'post', body: {'description': description});

      return RemoteCommentModel.fromJson(httpResponse).toEntity();
    } on HttpError catch (error) {
      throw error == HttpError.forbidden
          ? DomainError.accessDenied
          : DomainError.unexpected;
    }
  }
}
