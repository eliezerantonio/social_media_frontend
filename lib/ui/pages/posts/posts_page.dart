import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_front/ui/pages/posts/post_view_model.dart';
import 'package:social_media_front/ui/pages/posts/posts_presenter.dart';

import '../../helpers/i18n/resources.dart';
import 'components/components.dart';

class PostsPage extends StatelessWidget {
  final PostsPresenter presenter;
  const PostsPage(this.presenter);

  @override
  Widget build(BuildContext context) {
    presenter.loadData();
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: const Text('ClassDojo'),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            width: 0,
            height: 0,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                    image: NetworkImage(
                        "https://media-exp1.licdn.com/dms/image/C4E03AQGXYanhKHUo-g/profile-displayphoto-shrink_800_800/0/1636053493226?e=1669852800&v=beta&t=iIBSCdbhhLUwifaLR1qnpS84gKIipiyy3ORvKZ5IMKY"))),
          ),
        ),
        actions: const [
          Icon(Icons.notifications),
        ],
      ),
      body: Provider(
        create: (_) => presenter,
        child: StreamBuilder<List<PostViewModel>>(
            stream: presenter.loadPostsStream,
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
                            child: Text(R.string.reload))
                      ]),
                );
              }
              if (snapshot.hasData) {
                return ListView(
                  physics: const BouncingScrollPhysics(),
                  children: snapshot.data
                      .map((viewModel) => PostItem(viewModel))
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
      ),
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
