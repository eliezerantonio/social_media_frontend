import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

import '/main/factories/factories.dart';
import 'main/factories/pages/comments/comments.dart';
import 'main/factories/pages/posts/posts_page_factory.dart';
import 'main/factories/pages/signup/signup.dart';
import 'ui/components/componets.dart';
import 'ui/helpers/i18n/resources.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  R.load(const Locale('en', 'US'));
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  final routeObserver = Get.put<RouteObserver>(RouteObserver<PageRoute>());

    return GetMaterialApp(
      title: 'Social Media ',
      debugShowCheckedModeBanner: false,
      theme: makeAppATheme(),
          navigatorObservers: [routeObserver],
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: makeSplashPage, transition: Transition.fade),
        GetPage(name: '/login', page: makeLoginPage, transition: Transition.fadeIn),
        GetPage(name: '/signup', page: makeSignUpPage, transition: Transition.fadeIn),
        GetPage(name: '/posts', page: makePostsPage, transition: Transition.fadeIn),
        GetPage(name: '/comments/:postId', page: makeCommentsPage, transition: Transition.fadeIn),
      ],
    );
  }
}
