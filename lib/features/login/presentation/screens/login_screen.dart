import 'package:cine_rank/core/helpers/constants.dart';
import 'package:cine_rank/core/helpers/font_weight_helper.dart';
import 'package:cine_rank/core/helpers/spacing.dart';
import 'package:cine_rank/core/themes/colors.dart';
import 'package:cine_rank/features/login/presentation/widgets/login_button.dart';
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
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sign in with',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: KFontWeightHelper.semiBold,
                          color: KColors.grey,
                        ),
                  ),
                  horizontalSpace(16),
                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        colors: [
                          Color(0xff0d253f),
                          Color(0xff01b4e4),
                          Color(0xff90cea1),
                        ],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ).createShader(bounds);
                    },
                    blendMode: BlendMode.srcIn,
                    child: SvgPicture.asset(
                      KConstants.tmdbLogo,
                      width: 60.w,
                      height: 60.h,
                    ),
                  ),
                ],
              ),
              verticalSpace(72),
              const LoginButton(),
            ],
          ),
        ),
      ),
    );
  }
}
