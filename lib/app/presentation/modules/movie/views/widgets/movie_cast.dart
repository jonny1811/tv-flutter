import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../domain/either/either.dart';
import '../../../../../domain/failures/http_request/http_request_failure.dart';
import '../../../../../domain/models/performer/performer.dart';
import '../../../../../domain/repositories/movies_repository.dart';

class MovieCast extends StatefulWidget {
  const MovieCast({super.key, required this.movieId});
  final int movieId;

  @override
  State<MovieCast> createState() => _MovieCastState();
}

class _MovieCastState extends State<MovieCast> {
  late Future<Either<HttpRequestFailure, List<Performer>>> _future;

  @override
  void initState() {
    super.initState();
    _initFuture();
  }

  void _initFuture() {
    _future = context.read<MoviesRepository>().getCastByMovie(
      widget.movieId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      key: ValueKey(_future),
      future: _future,
      builder: (_, snapshot) {
        return const Text('CAST');
      },
    );
  }
}