import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key key, @required this.presenter}) : super(key: key);
  final SplashPresenter presenter;
  @override
  Widget build(BuildContext context) {
    presenter.checkAccount();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Social Media"),
        centerTitle: true,
      ),
      body: Builder(
        builder: (context) {
          presenter.navigateToStream.listen((page) {
            //caso receba pagina nula

            if (page?.isNotEmpty == true) {
              Get.offAllNamed(page);
            }
          });

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Social Media",
                    style: TextStyle(
                        fontSize: 33, color: Theme.of(context).primaryColor)),
                const SizedBox(
                  height: 10,
                ),
                CircularProgressIndicator(
                    color: Theme.of(context).primaryColor),
              ],
            ),
          );
        },
      ),
    );
  }
}
