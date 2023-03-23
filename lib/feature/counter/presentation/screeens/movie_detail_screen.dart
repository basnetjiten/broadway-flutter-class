import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_online_course/feature/counter/data/models/movie_details_model.dart';

@RoutePage()
class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({Key? key, required this.movieDetailsModel})
      : super(key: key);

  final MovieDetailsModel movieDetailsModel;

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Text(widget.movieDetailsModel.title),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Text(widget.movieDetailsModel.overview),
            )
          ],
        ),
      ),
    );
  }
}
