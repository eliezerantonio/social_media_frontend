import 'package:flutter/material.dart';

import 'components/components.dart';

class PostsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: const Text('ClassDojo', ),
        centerTitle: true,
        leading: const CircleAvatar(backgroundColor: Colors.white,radius: 1),
        actions: const [Icon(Icons.notifications)],
      ),

      body:ListView(

        children: [
          PostItem(),
          PostItem(),
          PostItem(),
        ],
      )
    );
  }
}