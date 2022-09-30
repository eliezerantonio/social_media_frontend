import 'package:equatable/equatable.dart';

import '../entities/entities.dart';

abstract class LoadComments{

  Future<List<CommentEntity>> load(String postId);
}


