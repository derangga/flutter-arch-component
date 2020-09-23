class MovieResponse {
  int page;
  int totalResults;
  int totalPages;
  List<Movies> moviesList;

  MovieResponse(
      {this.page, this.totalResults, this.totalPages, this.moviesList});

  MovieResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    totalResults = json['total_results'];
    totalPages = json['total_pages'];
    if (json['results'] != null) {
      moviesList = new List<Movies>();
      json['results'].forEach((v) {
        moviesList.add(new Movies.fromJson(v));
      });
    }
  }
}

class Movies {
  int voteCount;
  int id;
  String title;
  double popularity;
  String posterPath;
  String backdropPath;
  String overview;
  String releaseDate;

  Movies(
      {this.voteCount,
      this.id,
      this.title,
      this.popularity,
      this.posterPath,
      this.backdropPath,
      this.overview,
      this.releaseDate});

  Movies.fromJson(Map<String, dynamic> json) {
    voteCount = json['vote_count'];
    id = json['id'];
    title = json['title'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    backdropPath = json['backdrop_path'];
    overview = json['overview'];
    releaseDate = json['release_date'];
  }
}
