import 'package:flutter/material.dart';

import '../../../../ui/pages/splash/splash_page.dart';
import 'splash_presenter_factory.dart';

Widget makeSplashPage() {
  return SplashPage(presenter:makeGetxSplashPresenter());
}
