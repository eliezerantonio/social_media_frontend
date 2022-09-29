import 'package:flutter/material.dart';
import 'package:social_media_front/ui/helpers/errors/ui_error.dart';
import 'package:provider/provider.dart';

import '../../../helpers/i18n/resources.dart';
import '../login_presenter.dart';

class EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<LoginPresenter>(context);

    return StreamBuilder<UIError>(
      stream: presenter.emailErrorStream,
      builder: (context, snapshot) {
        return TextFormField(
          keyboardType: TextInputType.emailAddress,
          onChanged: presenter.validateEmail,
          decoration: InputDecoration(
            errorText: snapshot.hasData ? snapshot.data.description : null,
            labelText: R.string.email,
            icon: Icon(Icons.email, color: Theme.of(context).primaryColorLight),
          ),
        );
      },
    );
  }
}
