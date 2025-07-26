import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:inshorts_movies/core/constants/app_assets.dart';
import 'package:inshorts_movies/core/constants/app_colors.dart';
import 'package:inshorts_movies/core/injectable/injectable.dart';
import 'package:inshorts_movies/core/routes/app_router.dart';
import 'package:inshorts_movies/core/widgets/app_error_widget.dart';
import 'package:inshorts_movies/core/widgets/loading/shimmer_loading.dart';
import 'package:inshorts_movies/features/details/data/models/movie_details.dart';
import 'package:inshorts_movies/features/details/data/models/movie_video.dart';
import 'package:inshorts_movies/features/details/domain/usecases/movie_details_usecase.dart';
import 'package:inshorts_movies/features/details/presentation/cubit/movie_details_cubit.dart';
import 'package:inshorts_movies/features/details/presentation/ui/widgets/details_header_widget.dart';
import 'package:inshorts_movies/features/details/presentation/ui/widgets/genre_widget.dart';
import 'package:inshorts_movies/features/details/presentation/ui/widgets/movie_details_shimmer_layout.dart';
import 'package:inshorts_movies/features/details/presentation/ui/widgets/share_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetailsScreen extends StatefulWidget {
  final int movieId;

  const MovieDetailsScreen({required this.movieId, super.key});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  YoutubePlayerController? _trailerController;

  @override
  void dispose() {
    _trailerController?.dispose();
    super.dispose();
  }

  void _playTrailer(String youtubeKey) {
    _trailerController = YoutubePlayerController(
      initialVideoId: youtubeKey,
      flags: const YoutubePlayerFlags(autoPlay: true),
    );

    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: AspectRatio(
              aspectRatio: 16 / 9,
              child: YoutubePlayer(
                controller: _trailerController!,
                showVideoProgressIndicator: true,
              ),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) => MovieDetailsCubit(
            usecase: getIt<MovieDetailsUseCase>(),
            movieId: widget.movieId,
          ),
      child: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        builder: (context, state) {
          if (state is MovieDetailsLoading || state is MovieDetailsInitial) {
            return const ShimmerLoading(
              shimmerWidget: MovieDetailsShimmerLayout(),
            );
          } else if (state is MovieDetailsLoaded) {
            final details = state.details;
            MovieVideo? trailer;
            if (state.videos.results.isNotEmpty) {
              trailer = state.videos.results.firstWhere(
                (v) =>
                    v.site.toLowerCase() == 'youtube' &&
                    v.type.toLowerCase() == 'trailer',
                orElse: () => state.videos.results.first,
              );
            }

            return Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    // Backdrop with Play Button
                    _buildImageWidget(details, context, trailer),

                    // Details Container
                    _buildDetailsSection(details, context),
                  ],
                ),
              ),
            );
          } else if (state is MovieDetailsError) {
            return AppErrorWidget(
              onTap:
                  () => context.read<MovieDetailsCubit>().fetchMovieDetails(),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  Widget _buildDetailsSection(MovieDetails details, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DetailsHeaderWidget(details: details),
          const Gap(6),
          _buildIMDbRating(details),
          const Gap(12),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(Icons.share),
              onPressed:
                  () => ShareWidget.shareMovie(
                    widget.movieId,
                    details.title ?? '',
                  ),
            ),
          ),
          const Gap(12),
          GenreWidget(details: details),
          const Gap(16),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _infoLabel(
                "Length",
                "${details.runtime! ~/ 60}h ${details.runtime! % 60}min",
              ),
              _infoLabel(
                "Language",
                details.originalLanguage?.toUpperCase() ?? "-",
              ),
              _infoLabel("Status", details.status ?? "-"),
            ],
          ),

          const Gap(20),

          // Description
          const Text(
            "Description",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 3, 32, 75),
            ),
          ),
          const Gap(6),
          Text(
            details.overview ?? '',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.blue.shade500,
            ),
          ),
        ],
      ),
    );
  }

  Stack _buildImageWidget(
    MovieDetails details,
    BuildContext context,
    MovieVideo? trailer,
  ) {
    return Stack(
      children: [
        Hero(
          tag: 'moviePoster_${details.id}',
          child: CachedNetworkImage(
            imageUrl: details.backdropPath ?? "",
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
            placeholder: (context, url) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black26,
                      AppColors.secondaryBlackColor.withOpacity(0.1),
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
        if (trailer != null)
          Positioned(
            top: MediaQuery.of(context).size.height * 0.18,
            left: MediaQuery.of(context).size.width / 2 - 36,
            child: GestureDetector(
              onTap: () => _playTrailer(trailer.key),
              child: const CircleAvatar(
                radius: 28,
                backgroundColor: Colors.black45,
                child: Icon(Icons.play_arrow, color: Colors.white, size: 36),
              ),
            ),
          ),

        Positioned(
          top: 40,
          child: IconButton(
            onPressed: () => router.pop(),
            icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Row _buildIMDbRating(MovieDetails details) {
    return Row(
      children: [
        const Icon(Icons.star, color: Colors.amber, size: 16),
        const Gap(4),
        Text(
          '${details.voteAverage?.toStringAsFixed(1)}/10 IMDb',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.blue.shade500,
          ),
        ),
      ],
    );
  }

  Widget _infoLabel(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(color: AppColors.blue.shade400, fontSize: 14),
        ),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.blue.shade900,
          ),
        ),
      ],
    );
  }
}
