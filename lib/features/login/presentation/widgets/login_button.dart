import 'package:flutter/material.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/themes/colors.dart';
import '../../../../core/widgets/text_button.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return KTextButton(
      onPressed: () {
        context.pushNamed(KRoutes.loginWebView);
      },
      backgroundColor: KColors.blueAccent,
      buttonText: 'Sign in',
      fixedSize: Size(MediaQuery.sizeOf(context).width * 0.85, 0),
    );
  }
}
