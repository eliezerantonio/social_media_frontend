import 'package:flutter/material.dart';
import 'package:social_media_front/ui/pages/comments/comment_view_model.dart';

class CommentItem extends StatelessWidget {
  CommentViewModel viewModel ;
   CommentItem(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[

      Text(viewModel.description, style:const TextStyle(color: Colors.white, fontSize: 16)),
      const Divider(color: Colors.white,)
    ]);
  }
}