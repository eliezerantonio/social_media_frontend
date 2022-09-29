
import '../entities/entities.dart';

abstract class LoadPosts{

  Future<List<PostEntity>> load();
  
}