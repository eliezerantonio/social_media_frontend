import 'package:flutter/material.dart';

import '../post_view_model.dart';

class PostItem extends StatelessWidget {
  PostItem(this.viewModel);
  PostViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  image: const DecorationImage(
                    image: NetworkImage(
                        "https://mundonegro.inf.br/wp-content/uploads/2020/12/curso-online.jpg"),
                        fit: BoxFit.cover
                  ),
                ),
              ),
              title: const Text(
                "Prof. Mesquita",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: const Text("3.* ano B * 2 meses",
                  style: TextStyle(fontSize: 13, color: Colors.grey)),
            ),
            const SizedBox(height: 6),
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.network(viewModel.pics[0],
                  fit: BoxFit.cover, height: 330),
            ),
            const SizedBox(height: 6),
            Text(
              viewModel.description,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 6),
            const Text("Visualizar traducao",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(Icons.favorite, color: Colors.red, size: 18),
                const SizedBox(width: 6),
                Text(viewModel.likes.toString(),
                    style: const TextStyle(color: Colors.grey, fontSize: 16)),
                const SizedBox(width: 6),
                const Text("Gostos",
                    style: TextStyle(color: Colors.grey, fontSize: 16)),
                const SizedBox(width: 12),
                const Icon(Icons.sms, color: Colors.grey, size: 18),
                const SizedBox(width: 6),
                Text(viewModel.comments.toString(),
                    style: const TextStyle(color: Colors.grey, fontSize: 16)),
                const SizedBox(width: 6),
                const Text("Comentarios",
                    style: TextStyle(color: Colors.grey, fontSize: 16)),
              ],
            )
          ],
        ));
  }
}
