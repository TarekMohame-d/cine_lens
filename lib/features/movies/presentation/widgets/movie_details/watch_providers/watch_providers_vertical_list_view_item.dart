// import 'package:cine_rank/core/helpers/api_data_helper.dart';
// import 'package:cine_rank/core/helpers/spacing.dart';
// import 'package:cine_rank/core/themes/colors.dart';
// import 'package:cine_rank/features/movies/data/models/movie_watch_providers_model.dart';
// import 'package:cine_rank/features/movies/ui/widgets/movie_details/watch_providers/watch_providers_horizontal_list_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../../../../../core/themes/text_styles.dart';

// class WatchProvidersVerticalListViewItem extends StatelessWidget {
//   const WatchProvidersVerticalListViewItem({
//     super.key,
//     required this.index,
//     required this.listCount,
//     required this.watchProviders,
//     required this.countryCode,
//   });

//   final int index;
//   final int listCount;
//   final WatchProvider watchProviders;
//   final String countryCode;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 150.h,
//       margin: index == listCount
//           ? EdgeInsets.only(left: 16.0.w, right: 16.0.w)
//           : EdgeInsets.only(left: 16.0.w, right: 16.0.w, bottom: 12.0.h),
//       padding: EdgeInsets.symmetric(
//         horizontal: 12.0.w,
//         vertical: 12.0.w,
//       ),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         color: KColors.soft,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             ApiDataHelper.getCountryName(countryCode),
//             style: KTextStyles.font14WhiteSemiBold,
//           ),
//           verticalSpace(12),
//           WatchProvidersHorizontalListView(
//             watchProviders: watchProviders,
//           ),
//         ],
//       ),
//     );
//   }
// }
