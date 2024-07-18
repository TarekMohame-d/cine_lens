import '../../../core/helpers/constants.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/themes/app_text_styles.dart';
import 'widgets/login_button_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Image(
                image: const AssetImage(AppConstants.appLogo),
                width: 180.w,
                height: 180.h,
              ),
              verticalSpace(8),
              Image(
                image: const AssetImage(AppConstants.appBranding),
                width: 130.w,
              ),
              verticalSpace(24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sign in with TMDB',
                    style: AppTextStyles.font14GreySemiBold,
                  ),
                  horizontalSpace(16),
                  SvgPicture.asset(
                    AppConstants.tmdb,
                    colorFilter: const ColorFilter.mode(
                      Color(0xff01b4e4),
                      BlendMode.srcIn,
                    ),
                    width: 30.w,
                    height: 30.h,
                  ),
                ],
              ),
              const Spacer(),
              const LoginButtonBlocBuilder(),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
