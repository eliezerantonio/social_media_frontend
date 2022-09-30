import 'package:flutter/material.dart';

import '../../../../ui/pages/comments/commentss_page.dart';
import '../../../../ui/pages/pages.dart';
import 'comments_presenter_factory.dart';


Widget makeCommentsPage() {
  return CommentsPage(makeGetxCommentsPresenter());
}
