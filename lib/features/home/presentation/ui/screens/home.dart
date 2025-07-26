import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:inshorts_movies/core/constants/string_constants.dart';
import 'package:inshorts_movies/core/injectable/injectable.dart';
import 'package:inshorts_movies/core/widgets/app_error_widget.dart';
import 'package:inshorts_movies/core/widgets/fading_line.dart';
import 'package:inshorts_movies/core/widgets/loading/shimmer_loading.dart';
import 'package:inshorts_movies/features/home/domain/usecases/movies_usecase.dart';
import 'package:inshorts_movies/features/home/presentation/cubit/home_cubit.dart';
import 'package:inshorts_movies/features/home/presentation/ui/widgets/home_app_bar.dart';
import 'package:inshorts_movies/features/home/presentation/ui/widgets/now_playing_movies_card.dart';
import 'package:inshorts_movies/features/home/presentation/ui/widgets/trending_movies_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(usecase: getIt<MoviesUsecase>()),
      child: Scaffold(body: _buildBody()),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        HomeCubit cubit = context.read<HomeCubit>();

        if (state is HomeLoading) {
          return const ShimmerLoading();
        }
        if (state is HomeError) {
          return AppErrorWidget(
            onTap: () async {
              await cubit.fetchMoviesData();
            },
          );
        }
        return Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color.fromARGB(255, 142, 111, 145), Colors.white],
            ),
          ),
          child: RefreshIndicator(
            onRefresh: () async {
              await cubit.fetchMoviesData();
            },
            child: NotificationListener<ScrollEndNotification>(
              onNotification: (scrollEnd) {
                final metrics = scrollEnd.metrics;
                double maxScroll = metrics.maxScrollExtent;
                double currentScroll = metrics.pixels;
                double delta = 400.0;
                if (maxScroll - currentScroll <= delta) {
                  cubit.getPaginationNowPlayingMovies();
                }
                return false;
              },
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(8),
                    const HomeAppBar(),
                    ..._buildTrendingMoviesWidget(cubit),
                    const Gap(32),
                    ..._buildNowPlayingMoviesWidget(cubit),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  List<Widget> _buildTrendingMoviesWidget(HomeCubit cubit) {
    return [
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              StringConstants.trending,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Gap(16),
            FadingLine(),
          ],
        ),
      ),
      const Gap(20),
      SizedBox(
        height: 350,
        child: ListView.builder(
          itemCount: cubit.trendingMoviesList.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return TrendingMoviesCard(index: index);
          },
        ),
      ),
    ];
  }

  List<Widget> _buildNowPlayingMoviesWidget(HomeCubit cubit) {
    return [
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              StringConstants.nowPlaying,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Gap(16),
            FadingLine(),
          ],
        ),
      ),
      ListView.builder(
        itemCount: cubit.nowPlayingMoviesList.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return NowPlayingMoviesCard(
            movieData: cubit.nowPlayingMoviesList[index],
          );
        },
      ),
    ];
  }
}
