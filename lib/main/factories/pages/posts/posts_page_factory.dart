import 'package:flutter/material.dart';

import '../../../../ui/pages/pages.dart';
import 'posts_presenter_factory.dart';


Widget makePostsPage() {
  return PostsPage(makeGetxPostsPresenter());
}
