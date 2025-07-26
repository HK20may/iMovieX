import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:inshorts_movies/core/constants/app_assets.dart';
import 'package:inshorts_movies/core/constants/app_colors.dart';
import 'package:inshorts_movies/core/constants/string_constants.dart';
import 'package:inshorts_movies/core/routes/app_router.dart';
import 'package:inshorts_movies/core/routes/routes_path.dart';
import 'package:inshorts_movies/core/utils/inshorts_movies_utils.dart';
import 'package:inshorts_movies/core/widgets/custom_container.dart';
import 'package:inshorts_movies/features/bookmarks/data/models/bookmark.dart';
import 'package:inshorts_movies/features/bookmarks/presentation/ui/widgets/bookmark_heart_widget.dart';
import 'package:inshorts_movies/features/home/data/models/movie.dart';
import 'package:inshorts_movies/features/home/presentation/cubit/home_cubit.dart';

class TrendingMoviesCard extends StatelessWidget {
  final int index;
  const TrendingMoviesCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = context.read<HomeCubit>();
    Movie movieData = cubit.trendingMoviesList[index];
    return InkWell(
      onTap: () => router.push(RoutesPath.details, extra: movieData.id),
      child: Padding(
        padding: EdgeInsets.only(left: index == 0 ? 20 : 10),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Stack(
            children: [
              CustomContainer(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: CachedNetworkImage(
                          imageUrl:
                              movieData.posterPath ?? AppAssets.placeHolder,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                          placeholder: (context, url) {
                            return DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black26,
                                    AppColors.secondaryBlackColor.withOpacity(
                                      0.1,
                                    ),
                                  ],
                                  begin: Alignment.bottomRight,
                                  end: Alignment.topLeft,
                                ),
                              ),
                            );
                          },
                          errorWidget:
                              (context, url, error) => Image.asset(
                                AppAssets.placeHolder,
                                height: 150,
                              ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: _movieDescription(movieData),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: _viewCount(movieData),
                    ),
                  ],
                ),
              ),
              _ratingStar(movieData),
            ],
          ),
        ),
      ),
    );
  }

  Widget _movieDescription(Movie movieData) {
    return CustomContainer(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black.withOpacity(0.9), Colors.black26],
            begin: Alignment.bottomCenter,
            end: Alignment.topLeft,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5,
            sigmaY: 5,
            tileMode: TileMode.mirror,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Spacer(),
                    Expanded(
                      child: Row(
                        children: [
                          Image.asset(
                            AppAssets.locationPin,
                            color: Colors.white,
                            height: 14,
                          ),
                          const Gap(8),
                          const Flexible(
                            child: Text(
                              'English',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Gap(24),
                Text(
                  movieData.originalTitle ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                const Gap(4),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      AppAssets.calendarIcon,
                      height: 20,
                      color: AppColors.blue.shade200,
                    ),
                    const Gap(4),
                    Expanded(
                      child: Text(
                        movieData.overview ?? "",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColors.blue.shade200,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    const Gap(40),
                  ],
                ),
                const Gap(8),
                Text(
                  "${InshortsMoviesUtils().formatNumber(movieData.voteCount ?? 0)} ${StringConstants.votes}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _viewCount(Movie movieData) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, AppColors.secondaryBlackColor],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                AppAssets.eyeIcon,
                color: AppColors.blue.shade200,
                height: 20,
              ),
              const Gap(4),
              Text(
                InshortsMoviesUtils().formatNumber(
                  movieData.popularity?.toInt() ?? 0,
                ),
                style: TextStyle(
                  color: AppColors.blue.shade400,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        const Gap(8),
        BookmarkHeartWidget(
          bookmark: Bookmark(
            id: movieData.id ?? 0,
            title: movieData.title ?? '',
            posterPath: movieData.posterPath ?? '',
            rating: movieData.voteAverage ?? 0.0,
            releaseDate: movieData.releaseDate ?? '',
          ),
        ),
      ],
    );
  }

  Widget _ratingStar(Movie movieData) {
    return Positioned(
      left: 40,
      top: 20,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            movieData.voteAverage.toString(),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Gap(4),
          const Padding(
            padding: EdgeInsets.only(bottom: 4),
            child: Text("⭐", style: TextStyle(fontSize: 15)),
          ),
        ],
      ),
    );
  }
}
