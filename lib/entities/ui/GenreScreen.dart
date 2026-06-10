import 'package:flutter/material.dart';
import 'package:prm393_lab/data.dart';
import 'package:prm393_lab/entities/ui/Movie.dart';
import 'package:prm393_lab/entities/ui/MovieListWidget.dart';

class GenreScreen extends StatefulWidget {
  const GenreScreen({super.key});

  @override
  State<GenreScreen> createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  final TextEditingController searchController = TextEditingController();

  String selectedSort = "A-Z";

  final Set<String> selectedGenres = {};

  final List<String> genres = [
    "Action",
    "Drama",
    "Comedy",
    "Sci-Fi",
    "Animation",
  ];

  final List<String> sortSelections = ["A-Z", "Z-A", "Year", "Rating"];

  List<Movie> getVisibleMovies() {
    List<Movie> movies = Data.allMovies.where((movie) {
      final matchesSearch = movie.title.toLowerCase().contains(
        searchController.text.toLowerCase(),
      );

      final matchesGenre =
          selectedGenres.isEmpty ||
          movie.genres.any((genre) => selectedGenres.contains(genre));
      return matchesGenre && matchesSearch;
    }).toList();

    switch (selectedSort) {
      case "A-Z":
        movies.sort((a, b) => a.title.compareTo(b.title));
        break;
      case "Z-A":
        movies.sort((a, b) => b.title.compareTo(a.title));
        break;
      case "Rating":
        movies.sort((a, b) => b.rating.compareTo(a.rating));
        break;
      case "Year":
        movies.sort((a, b) => b.year.compareTo(a.year));
        break;
    }
    return movies;
  }

  @override
  Widget build(BuildContext context) {
    final movies = getVisibleMovies();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Find a Movie",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: "Search movies...",
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
                const SizedBox(height: 16),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Genres (${selectedGenres.length})",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: genres.map((genres) {
                    return FilterChip(
                      label: Text(genres),
                      selected: selectedGenres.contains(genres),
                      onSelected: (value) {
                        setState(() {
                          if (value) {
                            selectedGenres.add(genres);
                          } else {
                            selectedGenres.remove(genres);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MediaQuery.of(context).size.width < 450
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.start,
                  spacing: 16,
                  children: [
                    const Text(
                      "Sort by",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    DropdownButton<String>(
                      items: sortSelections.map((item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      value: selectedSort,
                      onChanged: (value) {
                        setState(() {
                          selectedSort = value!;
                        });
                      },
                    ),
                  ],
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    fixedSize: Size(200, 40),
                  ),
                  onPressed: () {
                    setState(() {
                      selectedSort = "A-Z";
                      selectedGenres.clear();
                      searchController.clear();
                    });
                  },
                  child: Text("Reset filter"),
                ),
                const SizedBox(height: 16),
                MovieListWidget(movies: movies),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
