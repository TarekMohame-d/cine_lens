import 'package:flutter/material.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/themes/colors.dart';
import '../../../../core/widgets/text_field.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.onChanged});
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
          child: KTextField(
            hintText: 'Search',
            prefixIcon: const Icon(
              Icons.search_rounded,
              color: KColors.grey,
            ),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}