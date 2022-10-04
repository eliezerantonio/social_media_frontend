import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_front/ui/pages/comments/comments_presenter.dart';


class CommentInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<CommentsPresenter>(context);
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            height: 50,
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: TextFormField(
                  maxLines: 40,
                  onChanged: presenter.validateDescritpion,
                  decoration: const InputDecoration(
                    hintText: "Escreva um comentario",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 7,
                    ),
                  ),
                )
          ),
        ),
        IconButton(
          onPressed:presenter.save
          
          
          ,
          icon: const Icon(Icons.send, color: Colors.white, size: 30),
        )
      ],
    );
  }
}
