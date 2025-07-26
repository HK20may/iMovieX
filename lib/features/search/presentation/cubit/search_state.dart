part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchPaginationLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<Movie> result;
  const SearchLoaded(this.result);

  @override
  List<Object> get props => [result];
}

final class SearchError extends SearchState {}
