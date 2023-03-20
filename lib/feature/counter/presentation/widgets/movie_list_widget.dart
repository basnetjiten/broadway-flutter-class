import 'package:flutter/material.dart';
import 'package:flutter_online_course/feature/counter/presentation/blocs/movie_cubit/movie_cubit.dart';

class MovieListWidget extends StatelessWidget {
  const MovieListWidget({super.key, required this.movieFetched});

  final MovieFetched movieFetched;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: movieFetched.moviesCard.length,
      itemBuilder: (context, index) {
        final movie = movieFetched.moviesCard[index];

        return Container(
          height: 250,
          width: 150,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green),
            color: Colors.black,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network('https://image.tmdb.org/t/p/w300${movie.posterPath}',height: 60,width: 60,),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  movie.title,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,0,20,20),
                child: Text('(${movie.releaseDate.year})',style: const TextStyle(color: Colors.white),),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(20,0,20,20),
                child: Text(movie.backdropPath,style: const TextStyle(color: Colors.white),),
              ),

            ],
          ),
        );
      },
    );
  }
}
