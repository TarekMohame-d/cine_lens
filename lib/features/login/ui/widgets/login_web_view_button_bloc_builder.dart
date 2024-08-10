import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../logic/login_cubit.dart';

class LoginWebViewButtonBlocBuilder extends StatelessWidget {
  const LoginWebViewButtonBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        var cubit = context.read<LoginCubit>();
        return Padding(
          padding: EdgeInsets.only(
            left: 24.0.w,
            right: 24.0.w,
            top: 32.0.h,
            bottom: 24.0.h,
          ),
          child: AppTextButton(
            onPressed: () async {
              await cubit.createSession();
              if (cubit.sessionModel != null) {
                if (cubit.sessionModel!.success!) {
                  await cubit.getUserAccount();
                  context.pushNamedAndRemoveUntil(
                    Routes.homeScreen,
                    predicate: (Route<dynamic> route) => false,
                  );
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    duration: Duration(milliseconds: 200),
                    content: Text(
                      'Please login first',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }
            },
            backgroundColor: AppColors.blueAccent,
            borderRadius: 32,
            buttonHeight: 56,
            buttonText: 'Continue',
            textStyle: AppTextStyles.font16WhiteSemiBold,
          ),
        );
      },
    );
  }
}
