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
       
        actions: const [
          Icon(Icons.notifications),
        ],
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
                          child: Text(R.string.reload, style: const TextStyle(color:Colors.white),))
                    ]),
              );
            }
            if (snapshot.hasData) {
              return ListView(
                physics: const BouncingScrollPhysics(),
                children: snapshot.data
                    .map((viewModel) =>CommentItem(viewModel))
                    .toList(),
              );
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(
                      color: Colors.white),
                  SizedBox(height: 10),
                  Text("Aguarde ...", textAlign: TextAlign.center, style: TextStyle(color:Colors.white),)
                ],
              ),
            );
          }),
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey,
          backgroundColor: Theme.of(context).primaryColorLight,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.picture_in_picture,
                ),
                label: 'Diario'),
            BottomNavigationBarItem(
                icon: Icon(Icons.people, color: Colors.grey),
                label: 'Criancas'),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_circle, color: Colors.grey),
                label: 'Pontos'),
            BottomNavigationBarItem(
                icon: Icon(Icons.sms, color: Colors.grey), label: 'Mensagem'),
            BottomNavigationBarItem(
                icon: Icon(Icons.tips_and_updates, color: Colors.grey),
                label: 'Descobrir'),
          ]),
    );
  }
}
