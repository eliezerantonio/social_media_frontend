import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
class CommentViewModel extends Equatable{
final String id;
  final String description;
  final String postId;
  final String userId;

  const CommentViewModel({@required this.id, @required this.description, @required this.postId, @required this.userId});

 

  @override
  List<Object> get props => ['id', 'postId', 'userId', 'description',];

}