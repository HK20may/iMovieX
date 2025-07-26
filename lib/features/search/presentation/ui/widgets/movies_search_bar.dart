import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inshorts_movies/core/constants/app_assets.dart';
import 'package:inshorts_movies/core/utils/debounce.dart';
import 'package:inshorts_movies/features/search/presentation/cubit/search_cubit.dart';

class MoviesSearchBar extends StatelessWidget {
  const MoviesSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    SearchCubit cubit = context.read<SearchCubit>();
    TextEditingController controller = TextEditingController();
    return SizedBox(
      height: 50,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Search Movies by name...',
          contentPadding: const EdgeInsets.symmetric(vertical: 0),
          isDense: true,
          hintStyle: const TextStyle(fontWeight: FontWeight.w400),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(16),
            child: SvgPicture.asset(AppAssets.searchIcon, height: 22),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide.none,
          ),
          fillColor: Colors.white,
          filled: true,
        ),
        onChanged: (value) {
          cubit.query = value;
          if (value.isNotEmpty && value.length > 2) {
            Debounce.call(
              'ForgotPassword',
              const Duration(milliseconds: 1000),
              onExecute: () {
                cubit.fetchSearchResult();
              },
            );
          }
        },
      ),
    );
  }
}
