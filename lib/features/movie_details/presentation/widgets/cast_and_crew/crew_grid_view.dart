import 'package:cached_network_image/cached_network_image.dart';
import 'package:cine_rank/core/helpers/api_data_helper.dart';
import 'package:cine_rank/core/themes/colors.dart';
import 'package:cine_rank/features/movie_details/data/models/movie_cast_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CrewGridView extends StatelessWidget {
  const CrewGridView({super.key, required this.crew});

  final List<Crew> crew;

  Map<String, (String name, String? image, Set<String> department)>
      _getCrewData(List<Crew> crew) {
    Map<String, (String name, String? image, Set<String> department)> crewData =
        {};
    for (var member in crew) {
      if (crewData.containsKey(member.name)) {
        crewData[member.name]!.$3.add(member.department!);
      } else {
        crewData[member.name!] =
            (member.name!, member.profilePath, {member.department!});
      }
    }
    return crewData;
  }

  @override
  Widget build(BuildContext context) {
    final crewMembers = _getCrewData(crew).values.toList();
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 10.h,
        childAspectRatio: 3 / 5,
      ),
      itemCount: crewMembers.length,
      itemBuilder: (context, index) {
        String? imageUrl =
            KApiDataHelper.getImageUrl(path: crewMembers[index].$2);
        List<String> department = crewMembers[index].$3.toList();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: imageUrl.isNotEmpty
                  ? CachedNetworkImage(
                      imageUrl: imageUrl,
                      memCacheWidth: 200.0.w.toInt(),
                      maxWidthDiskCache:
                          (MediaQuery.sizeOf(context).width / 2).toInt(),
                      placeholder: (context, url) {
                        return Shimmer.fromColors(
                          baseColor: KColors.grey,
                          highlightColor: KColors.white,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12.0.r),
                                topRight: Radius.circular(12.0.r),
                              ),
                              color: KColors.white,
                            ),
                          ),
                        );
                      },
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.0.r),
                            topRight: Radius.circular(12.0.r),
                          ),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          Icon(Icons.image_not_supported_rounded),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12.0.r),
                          topRight: Radius.circular(12.0.r),
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.image_not_supported_rounded,
                          size: 54.r,
                        ),
                      ),
                    ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 8.0.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12.r),
                    bottomRight: Radius.circular(12.r),
                  ),
                  color: KColors.soft,
                ),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      crewMembers[index].$1,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Wrap(
                      children: List.generate(
                        department.length,
                        (i) {
                          return Text(
                            department[i] +
                                (i == department.length - 1 ? '' : ' / '),
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                  color: KColors.grey,
                                ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
