import '../entities/comment_entity.dart';

abstract class SaveComment{


  Future<void>save(String postId);
}