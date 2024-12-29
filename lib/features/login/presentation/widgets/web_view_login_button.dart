import 'package:cine_rank/core/helpers/extensions.dart';
import 'package:cine_rank/core/routing/routes.dart';
import 'package:cine_rank/core/widgets/custom_snack_bar.dart';
import 'package:cine_rank/features/login/presentation/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/colors.dart';
import '../../../../core/widgets/text_button.dart';

class WebViewLoginButton extends StatelessWidget {
  const WebViewLoginButton({super.key, required this.requestToken});

  final String requestToken;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 16.0.h),
      child: BlocListener<LoginCubit, LoginState>(
        listenWhen: (previous, current) =>
            current is LoginGetUserIdSuccess ||
            current is LoginGetUserIdFailure ||
            current is LoginCreateSessionFailure,
        listener: (context, state) {
          if (state is LoginGetUserIdSuccess) {
            context.pushNamedAndRemoveUntil(
              KRoutes.homeScreen,
              predicate: (Route<dynamic> route) => false,
            );
          } else if (state is LoginGetUserIdFailure) {
            customSnackBar(context,
                state.apiErrorModel?.statusMessage ?? 'Please login first');
          } else if (state is LoginCreateSessionFailure) {
            customSnackBar(context,
                state.apiErrorModel?.statusMessage ?? 'Please login first');
          }
        },
        child: KTextButton(
          onPressed: () async {
            await context.read<LoginCubit>().createSession(requestToken);
          },
          backgroundColor: KColors.blueAccent,
          buttonText: 'Continue',
          fixedSize: Size(MediaQuery.sizeOf(context).width * 0.85, 0),
        ),
      ),
    );
  }
}
