part of 'movie_cubit.dart';

abstract class MovieState extends Equatable {
  const MovieState();
}

class MovieInitial extends MovieState {
  @override
  List<Object> get props => [];
}

class MovieFetched extends MovieState {
  const MovieFetched(this.moviesCard);

  final List<MovieCardModel> moviesCard;

  @override
  List<Object> get props => [moviesCard];
}


class MovieDetailFetched extends MovieState {
  const MovieDetailFetched(this.movieDetailsModel);

  final MovieDetailsModel movieDetailsModel;

  @override
  List<Object?> get props => [movieDetailsModel];
}
