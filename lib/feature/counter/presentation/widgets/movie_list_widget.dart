import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_online_course/core/utils/hive_storage.dart';
import 'package:flutter_online_course/feature/counter/data/models/movie_card_model.dart';
import 'package:flutter_online_course/feature/counter/presentation/blocs/movie_cubit/movie_cubit.dart';

class MovieListWidget extends StatefulWidget {
  const MovieListWidget(
      {super.key,
      required this.movieFetched,
      required this.onClick,
      required this.onBookmark});

  final Function(int id) onClick;
  final Function(int id) onBookmark;
  final MovieFetched movieFetched;

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final List<MovieCardModel> movies = [];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: widget.movieFetched.moviesCard.length,
        itemBuilder: (context, index) {
          final movie = widget.movieFetched.moviesCard[index];
          return GestureDetector(
            onTap: () => widget.onClick(movie.id),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                SizedBox(
                  width: 190,
                  height: 400,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      width: 160,
                      fit: BoxFit.fill,
                      imageUrl:
                          'https://image.tmdb.org/t/p/w300${movie.posterPath}',
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        color: Colors.black87,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "${movie.title} ",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              maxLines: 4,
                            ),
                            Text(
                              (movie.releaseDate == "")
                                  ? ""
                                  : "(${movie.releaseDate})",
                              style: const TextStyle(color: Colors.white),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              movie.overview,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: const TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        widget.onBookmark(movie.id);
                        HiveUtils.setString(
                            'movie', jsonEncode(movie.toJson()));
                        movies.add(movie);
                        HiveUtils.saveMovies('movies', movies);
                      });
                    },
                    icon: (HiveUtils.getMovieId('movieId') != null &&
                            HiveUtils.getMovieId('movieId') == movie.id)
                        ? const Icon(
                            Icons.bookmark,
                            color: Colors.purple,
                          )
                        : const Icon(
                            Icons.bookmark_border_outlined,
                            color: Colors.white,
                          ),
                  ),
                )
              ],
            ),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 15,
            childAspectRatio: 0.6),
      ),
    );
  }
}
