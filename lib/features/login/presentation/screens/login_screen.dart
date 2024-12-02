import 'package:cine_rank/core/helpers/constants.dart';
import 'package:cine_rank/core/helpers/spacing.dart';
import 'package:cine_rank/core/themes/text_styles.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: const AssetImage(KConstants.appLogo),
              width: 180.w,
              height: 180.h,
            ),
            verticalSpace(8),
            Image(
              image: const AssetImage(KConstants.appBranding),
              width: 130.w,
            ),
            verticalSpace(24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sign in with TMDB',
                  style: KTextStyles.font14GreySemiBold,
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
                    width: 30.w,
                    height: 30.h,
                  ),
                ),
              ],
            ),
            verticalSpace(72),
            const LoginButton(),
          ],
        ),
      ),
    );
  }
}
