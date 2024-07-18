import 'package:cine_rank/core/helpers/extensions.dart';
import 'package:cine_rank/core/routing/routes.dart';
import 'package:cine_rank/core/themes/app_colors.dart';
import 'package:cine_rank/core/themes/app_text_styles.dart';
import 'package:cine_rank/core/widgets/app_text_button.dart';
import 'package:cine_rank/features/login/logic/login_cubit.dart';
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
          onPressed: () async {
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
