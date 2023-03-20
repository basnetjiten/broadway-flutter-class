import 'package:flutter_online_course/feature/counter/data/data_source/movie_data_source.dart';
import 'package:flutter_online_course/feature/counter/data/models/movie_card_model.dart';

/// calls the appropriate datasource
/// and its related method calls
class MovieRepository {
  MovieRepository(this._movieDataSource);

  late final MovieDataSource _movieDataSource;

  /// calls [_movieDataSource] methods passing the  [url]
  Future<List<MovieCardModel>> getUpcomingMovies({required String url}) async {
    return await _movieDataSource.fetchUpcomingMovies(upcomingMovies: url);
  }
}
