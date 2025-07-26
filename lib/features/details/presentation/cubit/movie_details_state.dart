part of 'movie_details_cubit.dart';

abstract class MovieDetailsState extends Equatable {
  const MovieDetailsState();
  @override
  List<Object?> get props => [];
}

class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailsLoading extends MovieDetailsState {}

class MovieDetailsLoaded extends MovieDetailsState {
  final MovieDetails details;
  final MovieVideoResponse videos;
  const MovieDetailsLoaded({required this.details, required this.videos});
  @override
  List<Object?> get props => [details, videos];
}

class MovieDetailsError extends MovieDetailsState {}
