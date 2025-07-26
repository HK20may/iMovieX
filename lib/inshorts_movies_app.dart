import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:inshorts_movies/core/injectable/injectable.dart';
import 'package:inshorts_movies/core/routes/app_router.dart';
import 'package:inshorts_movies/features/bookmarks/domain/usecases/bookmarks_usecase.dart';
import 'package:inshorts_movies/features/bookmarks/presentation/cubit/bookmarks_cubit.dart';

class InshortsMoviesApp extends StatelessWidget {
  const InshortsMoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookmarksCubit(usecase: getIt<BookmarksUsecase>()),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        builder: (context, child) {
          return FToastBuilder()(context, child);
        },
      ),
    );
  }
}
