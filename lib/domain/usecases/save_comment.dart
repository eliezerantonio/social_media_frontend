import '../entities/comment_entity.dart';

abstract class SaveComment{


  Future<CommentEntity>save(String description);
}