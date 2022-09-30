import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class PostEntity extends Equatable {
  final String id;
  final String description;
  final int likes;
  final int comments;
  final DateTime created;
  final List<dynamic> pics;

  const PostEntity({
    @required this.id,
    @required this.description,
    @required this.likes,
    @required this.comments,
    @required this.created,
    @required this.pics,
  });

  @override
  List<Object> get props => ['id', 'likes', 'comments', 'description', 'created', 'pics'];
}
