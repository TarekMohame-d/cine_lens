import '../../../../core/helpers/extensions.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key,required this.onChanged});
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        Expanded(
          child: AppTextField(
            hintText: 'Search',
            prefixIcon: const Icon(
              Icons.search_rounded,
              color: AppColors.grey,
              size: 24,
            ),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
