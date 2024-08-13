import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../logic/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButtonBlocBuilder extends StatelessWidget {
  const LoginButtonBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        var cubit = context.read<LoginCubit>();
        return AppTextButton(
          onPressed: () {
            context.pushNamed(
              Routes.webViewScreen,
              arguments: cubit.requestTokenModel!.requestToken!,
            );
          },
          backgroundColor: AppColors.blueAccent,
          borderRadius: 32,
          buttonHeight: 56,
          buttonText: 'Sign in',
          textStyle: AppTextStyles.font16WhiteSemiBold,
        );
      },
    );
  }
}
