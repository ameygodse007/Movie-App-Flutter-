class TvShow {
    TvShow({
        required this.backdropPath,
        required this.firstAirDate,
        required this.genreIds,
        required this.id,
        required this.name,
        required this.originCountry,
        required this.originalLanguage,
        required this.originalName,
        required this.overview,
        required this.popularity,
        required this.posterPath,
        required this.voteAverage,
        required this.voteCount,
    });

    String backdropPath;
    String firstAirDate;
    List<dynamic> genreIds;
    dynamic id;
    String name;
    List<String> originCountry;
    String originalLanguage;
    String originalName;
    String overview;
    dynamic popularity;
    String posterPath;
    dynamic voteAverage;
    dynamic voteCount;
}
