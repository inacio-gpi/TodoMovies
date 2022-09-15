import 'package:flutter/material.dart';

import '../controller/movie_controller.dart';

class MovieDetailsPage extends StatelessWidget {
  final MovieController controller;
  const MovieDetailsPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "movie details page",
            ),
            TextButton(
              child: const Text('press here'),
              onPressed: () async {
                await controller.getMovieDetails(20);
              },
            ),
          ],
        ),
      ),
    );
  }
}
