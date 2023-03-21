import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_online_course/feature/counter/data/models/pizza.dart';
import 'package:flutter_online_course/feature/counter/presentation/blocs/movie_cubit/movie_cubit.dart';
import 'package:flutter_online_course/feature/counter/presentation/blocs/pizza_cubit/pizza_cubit.dart';
import 'package:flutter_online_course/feature/counter/presentation/pizza_list_screen.dart';
import 'package:flutter_online_course/feature/counter/presentation/widgets/movie_list_widget.dart';
import 'package:flutter_online_course/main.dart';

class MovieHomeScreen extends StatefulWidget {
  const MovieHomeScreen({Key? key}) : super(key: key);

  @override
  State<MovieHomeScreen> createState() => _MovieHomeScreenState();
}

class _MovieHomeScreenState extends State<MovieHomeScreen> {
  late MovieCubit _movieCubit;
  @override
  void initState() {
    super.initState();
    _movieCubit= getIt<MovieCubit>();
    _movieCubit.getUpcomingMovies(
        apiUrl:
            'http://api.themoviedb.org/3/movie/upcoming?api_key=caebc202bd0a26f84f4e0d986beb15cd');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pizza Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Pizza initial screeen'),
            Expanded(
              child: BlocBuilder<MovieCubit, MovieState>(
                  bloc:_movieCubit,
                  builder: (context, state) {
                    if (state is MovieFetched) {
                      return MovieListWidget(
                        movieFetched: state, onClick: (int movieId) {
                        _movieCubit.getMovieDetails(movieId: movieId);
                      },
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

//BlocProvider
//BlocBuilder
//BlocListener
//BlocConsumer
//BlocSelector
//MultiBlocListener
//MultiBlocProvider

//dio package
// auto_route
