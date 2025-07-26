import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:inshorts_movies/core/constants/app_assets.dart';
import 'package:inshorts_movies/core/constants/app_colors.dart';
import 'package:inshorts_movies/core/constants/string_constants.dart';
import 'package:inshorts_movies/core/routes/app_router.dart';
import 'package:inshorts_movies/core/routes/routes_path.dart';
import 'package:inshorts_movies/core/utils/inshorts_movies_utils.dart';
import 'package:inshorts_movies/features/bookmarks/data/models/bookmark.dart';
import 'package:inshorts_movies/features/bookmarks/presentation/ui/widgets/bookmark_heart_widget.dart';
import 'package:inshorts_movies/features/home/data/models/movie.dart';

class NowPlayingMoviesCard extends StatelessWidget {
  final Movie movieData;
  final EdgeInsetsGeometry? margin;
  final bool showDescription;
  const NowPlayingMoviesCard({
    super.key,
    required this.movieData,
    this.margin = const EdgeInsets.only(bottom: 16, right: 20, left: 20),
    this.showDescription = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => router.push(RoutesPath.details, extra: movieData.id),
      child: Container(
        margin: margin,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: AppColors.boxShadowColor.withOpacity(.6),
              offset: const Offset(0, 0),
              blurRadius: 16,
              spreadRadius: -5,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(4),
              child: Stack(
                children: [
                  Hero(
                    tag: 'moviePoster_${movieData.id}',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        imageUrl: movieData.backdropPath ?? '',
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.contain,
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
                            (context, url, error) =>
                                Image.asset(AppAssets.placeHolder, height: 150),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: BookmarkHeartWidget(
                      bookmark: Bookmark(
                        id: movieData.id ?? 0,
                        title: movieData.title ?? '',
                        posterPath: movieData.posterPath ?? '',
                        rating: movieData.voteAverage ?? 0.0,
                        releaseDate: movieData.releaseDate ?? '',
                      ),
                    ),
                  ),
                  if (showDescription)
                    Positioned(
                      bottom: 20,
                      left: 10,
                      child: Container(
                        padding: EdgeInsets.all(
                          (movieData.popularity?.toInt().toString().length ??
                                      0) >
                                  2
                              ? 10
                              : 16,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade800,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              AppAssets.eyeIcon,
                              color: AppColors.blue.shade200,
                              height: 22,
                            ),
                            Text(
                              "${movieData.popularity?.toInt().toString()}K",
                              style: TextStyle(
                                color: AppColors.blue.shade400,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const Gap(16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                movieData.originalTitle ?? "",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
            ),
            if (showDescription) ...[
              const Gap(8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      AppAssets.calendarIcon,
                      height: 20,
                      color: AppColors.blue.shade700,
                    ),
                    const Gap(4),
                    Flexible(
                      child: Text(
                        movieData.overview ?? "",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          color: AppColors.blue.shade700,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(8),
            ],

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Gap(4),
                    Text(
                      "${InshortsMoviesUtils().formatNumber(movieData.voteCount ?? 0)} ${StringConstants.votes}",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: showDescription ? 20 : 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Gap(8),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: VerticalDivider(
                        thickness: 2,
                        color: Colors.grey.shade300,
                      ),
                    ),
                    const Gap(8),
                    Text(
                      movieData.voteAverage.toString(),
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: showDescription ? 20 : 14,
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
              ),
            ),
            Gap(showDescription ? 24 : 8),
          ],
        ),
      ),
    );
  }
}
