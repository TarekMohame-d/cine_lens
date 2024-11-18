import 'package:cine_rank/core/helpers/constants.dart';
import 'package:cine_rank/core/helpers/extensions.dart';
import 'package:cine_rank/core/routing/routes.dart';
import 'package:cine_rank/core/widgets/custom_snack_bar.dart';
import 'package:cine_rank/features/login/presentation/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/colors.dart';
import '../../../../core/themes/text_styles.dart';
import '../../../../core/widgets/text_button.dart';

class WebViewLoginButton extends StatelessWidget {
  const WebViewLoginButton({super.key, required this.requestToken});

  final String requestToken;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0.w).copyWith(
        top: 32.0.h,
        bottom: 24.0.h,
      ),
      child: BlocListener<LoginCubit, LoginState>(
        listenWhen: (previous, current) =>
            current is LoginGetUserIdSuccess ||
            current is LoginGetUserIdFailure ||
            current is LoginCreateSessionFailure,
        listener: (context, state) => _handleLoginState(context, state),
        child: KTextButton(
          onPressed: () => _onLoginButtonPressed(context),
          backgroundColor: KColors.blueAccent,
          borderRadius: 32,
          buttonHeight: 56,
          buttonText: 'Continue',
          textStyle: KTextStyles.font16WhiteSemiBold,
        ),
      ),
    );
  }

  Future<void> _onLoginButtonPressed(BuildContext context) async {
    await context.read<LoginCubit>().createSession(requestToken);
  }

  void _handleLoginState(BuildContext context, LoginState state) {
    if (state is LoginGetUserIdSuccess) {
      isLoggedIn = true;
      _navigateToHomeScreen(context);
    } else if (state is LoginGetUserIdFailure) {
      _showLoginError(context, state.apiErrorModel?.statusMessage);
    } else if (state is LoginCreateSessionFailure) {
      _showLoginError(context, state.apiErrorModel?.statusMessage);
    }
  }

  void _navigateToHomeScreen(BuildContext context) {
    context.pushNamedAndRemoveUntil(
      KRoutes.homeScreen,
      predicate: (Route<dynamic> route) => false,
    );
  }

  void _showLoginError(BuildContext context, [String? message]) {
    customSnackBar(
      context,
      message ?? 'Please login first',
      const Duration(milliseconds: 700),
    );
  }
}
