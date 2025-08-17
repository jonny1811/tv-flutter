
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/models/media/media.dart';
import '../global/controllers/favorites/favorites_controller.dart';

Future<void> markAsFavorite(
  BuildContext context,
  Media media,
) async {
  final FavoritesController favoritesController = context.read();
  final result = await favoritesController.markAsFavorite(media);
  result.whenOrNull(
    left: (failure) {
      final errorMessage = failure.when(
        notFound: () => 'Resource Not Found',
        network: () => 'Network Error',
        unauthorized: () => 'Unauthorized',
        unknown: () => 'Unknown Error'  
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
        ),
      );
    }
  );
}