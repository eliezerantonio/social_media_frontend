import 'package:flutter/material.dart';

import '../../domain/entities/entities.dart';

import '../http/http.dart';

class RemotePostModel {
   final String id;
   final String description;
   final int likes;
  final  String created;
  final List<dynamic> pics;

  RemotePostModel({@required this.id, @required this.likes, @required  this.description, @required this.created,@required this.pics});

  factory RemotePostModel.fromJson(Map json) {
    if (!json.keys.toSet().containsAll(['_id', 'likes', 'description', 'created', 'pics'])) {
      throw HttpError.invalidData;
    }

    return RemotePostModel(
      id: json['id'],
      likes: json['likes'],
      description: json['description'],
      created: json['created'],
      pics: json['pics'],
    );
  }

  PostEntity toEntity() => PostEntity(
        id: id,
        likes: likes,
        description: description,
        created: DateTime.parse(created),
        pics: pics,
      );
}
