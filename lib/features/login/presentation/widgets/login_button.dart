import 'package:flutter/material.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/themes/colors.dart';
import '../../../../core/themes/text_styles.dart';
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
      borderRadius: 32,
      buttonHeight: 56,
      buttonText: 'Sign in',
      textStyle: KTextStyles.font16WhiteSemiBold,
      buttonWidth: MediaQuery.sizeOf(context).width * 0.8,
    );
  }
}
