import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:prm393_lab/entities/ui/Movie.dart';
import 'package:prm393_lab/entities/ui/MovieWidget.dart';

class MovieListWidget extends StatelessWidget {
  final List<Movie> movies;

  const MovieListWidget({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (builder, context) {
        return MasonryGridView.count(
          crossAxisCount: context.maxWidth < 450 ? 1 : 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          itemCount: movies.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return MovieWidget(movie: movies[index]);
          },
        );
      },
    );
  }
}
