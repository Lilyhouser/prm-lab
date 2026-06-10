import 'package:prm393_lab/entities/ui/Movie.dart';

class Data {
  static List<Movie> allMovies = [
    Movie(
      title: "Inception",
      year: 2010,
      genres: ["Action", "Sci-Fi"],
      posterUrl:
          "https://upload.wikimedia.org/wikipedia/en/2/2e/Inception_%282010%29_theatrical_poster.jpg",
      rating: 8.8,
    ),
    Movie(
      title: "The Dark Knight",
      year: 2008,
      genres: ["Action", "Drama"],
      posterUrl:
          "https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_.jpg",
      rating: 9.0,
    ),
    Movie(
      title: "Interstellar",
      year: 2014,
      genres: ["Drama", "Sci-Fi"],
      posterUrl:
          "https://m.media-amazon.com/images/M/MV5BYzdjMDAxZGItMjI2My00ODA1LTlkNzItOWFjMDU5ZDJlYWY3XkEyXkFqcGc@._V1_.jpg",
      rating: 8.7,
    ),
    Movie(
      title: "Toy Story",
      year: 1995,
      genres: ["Comedy", "Animation"],
      posterUrl:
          "https://m.media-amazon.com/images/M/MV5BZTA3OWVjOWItNjE1NS00NzZiLWE1MjgtZDZhMWI1ZTlkNzYwXkEyXkFqcGc@._V1_.jpg",
      rating: 8.3,
    ),
    Movie(
      title: "The Hangover",
      year: 2009,
      genres: ["Comedy"],
      posterUrl:
          "https://upload.wikimedia.org/wikipedia/en/thumb/b/b9/Hangoverposter09.jpg/250px-Hangoverposter09.jpg",
      rating: 7.7,
    ),
  ];
}
