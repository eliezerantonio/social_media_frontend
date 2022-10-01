import 'package:flutter/material.dart';
import 'package:social_media_front/ui/pages/comments/comment_view_model.dart';

import '../../helpers/i18n/resources.dart';
import 'comments_presenter.dart';
import 'components/components.dart';

class CommentsPage extends StatelessWidget {
  final CommentsPresenter presenter;
  const CommentsPage(this.presenter);

  @override
  Widget build(BuildContext context) {
    presenter.loadData();
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: const Text('Comentarios'),
        centerTitle: true,
      
      ),
      body: StreamBuilder<List<CommentViewModel>>(
          stream: presenter.loadCommentsStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(snapshot.error,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center),
                      const SizedBox(height: 10),
                      ElevatedButton(
                          onPressed: presenter.loadData,
                          child: Text(
                            R.string.reload,
                            style: const TextStyle(color: Colors.white),
                          ))
                    ]),
              );
            }
            if (snapshot.hasData) {
              return ListView(
                physics: const BouncingScrollPhysics(),
                children: snapshot.data
                    .map((viewModel) => CommentItem(viewModel))
                    .toList(),
              );
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(color: Colors.white),
                  SizedBox(height: 10),
                  Text(
                    "Aguarde ...",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
                height: 50,
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 10,vertical:15 ),
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(30)),
                child: TextFormField(
                  maxLines: 40,
                  decoration: const InputDecoration(
                      hintText: "Escreva um comentario",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical:7 )),
                )),
          ),
               IconButton(onPressed: (){

              },
              
              icon:const Icon(Icons.send, color: Colors.white, size:30))
        ],
      ),
    );
  }
}
