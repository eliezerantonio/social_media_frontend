import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Prof. Mesquita",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            const Text("3.* ano B * 2 meses",
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold)),
            Image.network(
                "https://blog.trivium.com.br/wp-content/uploads/2021/03/original-1037bd06bfde2f8df26c8a0ed97086dc.jpeg"),
            const Text(
              "Esta Semana tem seido rempleta te actividades.\n Fomos aos laboratorios e realizamos varias experiencia, entre elas ua super experieincia com um fouetao!. Adoramos!",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
             const SizedBox(height: 6),
            const Text("Visualizar traducao", style: TextStyle(color: Colors.blue, fontSize: 16, fontWeight: FontWeight.bold)),
             const SizedBox(height: 6),
            Row(
              children: const [
                Icon(Icons.favorite, color: Colors.red, size: 18),
                SizedBox(width: 6),
                Text("6", style: TextStyle(color: Colors.grey, fontSize: 16)),
                SizedBox(width: 6),
                Text("Gostos",
                    style: TextStyle(color: Colors.grey, fontSize: 16)),
                SizedBox(width: 12),
                Icon(Icons.sms, color: Colors.grey, size: 18),
                SizedBox(width: 6),
                Text("Comentarios",
                    style: TextStyle(color: Colors.grey, fontSize: 16)),
              ],
            )
          ],
        ));
  }
}
