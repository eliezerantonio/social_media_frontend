import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

import '/main/factories/factories.dart';
import 'main/factories/pages/signup/signup.dart';
import 'ui/components/componets.dart';
import 'ui/helpers/i18n/resources.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  R.load(Locale('en', 'US'));
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return GetMaterialApp(
      title: 'Social Media ',
      debugShowCheckedModeBanner: false,
      theme: makeAppATheme(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: makeSplashPage, transition: Transition.fade),
        GetPage(name: '/login', page: makeLoginPage, transition: Transition.fadeIn),
        GetPage(name: '/signup', page: makeSignUpPage, transition: Transition.fadeIn),
        GetPage(name: '/posts', page:()=> Scaffold(body: Center(child:Text("Eliezer"))), transition: Transition.fadeIn),
      ],
    );
  }
}
