import 'package:equatable/equatable.dart';

import '../entities/entities.dart';

abstract class LoadComments{

  Future<List<CommentEntity>> load(String postId);
}


class  LoadCommentsParams extends Equatable{
  final String postId;

  const LoadCommentsParams(this.postId);
  
  @override
  List<Object> get props => [postId];

}