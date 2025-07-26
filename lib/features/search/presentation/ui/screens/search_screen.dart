import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:inshorts_movies/core/injectable/injectable.dart';
import 'package:inshorts_movies/core/widgets/app_error_widget.dart';
import 'package:inshorts_movies/core/widgets/fading_line.dart';
import 'package:inshorts_movies/core/widgets/no_result_found.dart';
import 'package:inshorts_movies/features/home/presentation/ui/widgets/now_playing_movies_card.dart';
import 'package:inshorts_movies/features/search/domain/usecases/search_movies_usecase.dart';
import 'package:inshorts_movies/features/search/presentation/cubit/search_cubit.dart';
import 'package:inshorts_movies/features/search/presentation/ui/widgets/movies_search_bar.dart';
import 'package:inshorts_movies/features/search/presentation/ui/widgets/searching_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(usecase: getIt<SearchMoviesUsecase>()),
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color.fromARGB(255, 142, 111, 145), Colors.white],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: _buildBody(context),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return _buildSearchResults();
  }

  Widget _buildSearchResults() {
    return Column(
      children: [
        const Gap(kToolbarHeight - 12),
        const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Search movie",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
            Gap(16),
            FadingLine(),
          ],
        ),

        const Gap(20),

        const MoviesSearchBar(),

        BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            if (state is SearchLoading) {
              return const Expanded(
                child: SearchingWidget(message: "Finding movies"),
              );
            }
            if (state is SearchError) {
              return Expanded(
                child: AppErrorWidget(
                  onTap: () async {
                    await context.read<SearchCubit>().fetchSearchResult();
                  },
                ),
              );
            }
            SearchCubit cubit = context.read<SearchCubit>();
            if (cubit.query.isNotEmpty && cubit.searchMoviesList.isEmpty) {
              return const Expanded(child: NoResultFound());
            }
            return Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: cubit.searchMoviesList.length,
                itemBuilder: (context, index) {
                  return NowPlayingMoviesCard(
                    movieData: cubit.searchMoviesList[index],
                    margin: const EdgeInsets.only(bottom: 16),
                    showDescription: false,
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
