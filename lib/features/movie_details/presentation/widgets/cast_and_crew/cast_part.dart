// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cine_rank/core/helpers/api_data_helper.dart';
// import 'package:cine_rank/core/helpers/spacing.dart';
// import 'package:cine_rank/core/themes/colors.dart';
// import 'package:cine_rank/core/themes/text_styles.dart';
// import 'package:cine_rank/features/movie_details/data/models/movie_cast_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:shimmer/shimmer.dart';

// class CastPart extends StatelessWidget {
//   const CastPart({super.key, required this.cast});
//   final List<Cast> cast;
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: cast.length,
//       itemBuilder: (context, index) {
//         return cast[index].profilePath != null &&
//                 cast[index].knownForDepartment != null &&
//                 cast[index].name != null
//             ? Container(
//                 height: 100.0.h,
//                 margin: EdgeInsets.only(bottom: 12.0.h),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Row(
//                   children: [
//                     CachedNetworkImage(
//                       imageUrl: KApiDataHelper.getImageUrl(
//                           path: cast[index].profilePath!),
//                       placeholder: (context, url) {
//                         return Shimmer.fromColors(
//                           baseColor: KColors.grey,
//                           highlightColor: Colors.white,
//                           child: Container(
//                             width: 48.0.w,
//                             height: 48.0.h,
//                             decoration: const BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: Colors.white,
//                             ),
//                           ),
//                         );
//                       },
//                       imageBuilder: (context, imageProvider) => Container(
//                         width: 48.0.w,
//                         height: 48.0.h,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           image: DecorationImage(
//                             image: imageProvider,
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                       ),
//                     ),
//                     horizontalSpace(8),
//                     Expanded(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                             cast[index].name!,
//                             style: KTextStyles.font14WhiteSemiBold,
//                           ),
//                           Text(
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             cast[index].knownForDepartment!,
//                             style: KTextStyles.font10GreyMedium,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             : const SizedBox.shrink();
//       },
//     );
//   }
// }
