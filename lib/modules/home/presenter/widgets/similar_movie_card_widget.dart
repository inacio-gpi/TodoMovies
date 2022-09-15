import 'package:flutter/widgets.dart';

import '../../../../core/constants/strings.dart';
import '../../domain/entities/genre_entity.dart';
import '../../domain/entities/similar_movies_entity.dart';

class SimilarMovieCardWidget extends StatelessWidget {
  final Results movie;
  final List<Genre> genres;

  const SimilarMovieCardWidget({
    Key? key,
    required this.movie,
    required this.genres,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String genderTitles = '';

    List<String> genderListTitles = [];
    for (var genreId in movie.genreIds) {
      final index = genres.indexWhere((e) => e.id == genreId);
      if (index != -1) {
        genderListTitles.add(genres[index].name);
      }
    }
    genderTitles = genderListTitles.join(', ');
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.network(
            movie.backdropPath == null
                ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSU0RKuelMjoDwhLCRPd2_CQ_a9-4xDQuTxV9DokPY&s'
                : BASE_IMAGE_URL + movie.backdropPath!,
            alignment: Alignment.center,
            height: double.infinity,
            width: 65,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 12),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  " ${movie.title}",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(" ${movie.releaseDate.year} $genderTitles"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
