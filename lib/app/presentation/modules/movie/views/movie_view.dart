import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/movie_controller.dart';
import '../controller/state/movie_state.dart';

class MovieView extends StatelessWidget {
  const MovieView({
    super.key,
    required this.movieId,
  });
  final int movieId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MovieController(
        MovieState.loading(), 
        movieId: movieId, 
        moviesRepository: context.read(),
      ),
      child: const Scaffold(),
    );
  }
}
