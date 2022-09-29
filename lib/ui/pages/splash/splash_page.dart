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
          title: Text("4Dev"),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(136, 14, 79, 1)),
      body: Builder(builder: (context) {
        presenter.navigateToStream.listen((page) {
          //caso receba pagina nula

          if (page?.isNotEmpty == true) {
            Get.offAllNamed(page);
          }
        });

        return Center(
            child: CircularProgressIndicator(
                color: Color.fromRGBO(136, 14, 79, 1)));
      }),
    );
  }
}
