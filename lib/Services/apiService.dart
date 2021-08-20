import 'dart:convert';

import 'package:movieapp/model/Actor.dart';
import 'package:movieapp/model/TvShow.dart';
import 'package:movieapp/model/cast_list.dart';
import 'package:movieapp/model/movie.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://api.themoviedb.org/3';
  final String apiKey = 'cdd513a4c476f9ad79cbe4c0eb6c8ed0';

  // Future<List<Movie>> getMovieByGenre(int movieId) async {
  //   try {
  //     final url = '$baseUrl/discover/movie?with_genres=$movieId&$apiKey';
  //     final response = await _dio.get(url);
  //     var movies = response.data['results'] as List;
  //     List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
  //     return movieList;
  //   } catch (error, stacktrace) {
  //     throw Exception(
  //         'Exception accoured: $error with stacktrace: $stacktrace');
  //   }
  // }

  // Future<List<Genre>> getGenreList() async {
  //   try {
  //     final response = await _dio.get('$baseUrl/genre/movie/list?$apiKey');
  //     var genres = response.data['genres'] as List;
  //     List<Genre> genreList = genres.map((g) => Genre.fromJson(g)).toList();
  //     return genreList;
  //   } catch (error, stacktrace) {
  //     throw Exception(
  //         'Exception accoured: $error with stacktrace: $stacktrace');
  //   }
  // }

  // Future<List<Person>> getTrendingPerson() async {
  //   try {
  //     final response = await _dio.get('$baseUrl/trending/person/week?$apiKey');
  //     var persons = response.data['results'] as List;
  //     List<Person> personList = persons.map((p) => Person.fromJson(p)).toList();
  //     return personList;
  //   } catch (error, stacktrace) {
  //     throw Exception(
  //         'Exception accoured: $error with stacktrace: $stacktrace');
  //   }
  // }

  // Future<MovieDetail> getMovieDetail(int movieId) async {
  //   try {
  //     final response = await _dio.get('$baseUrl/movie/$movieId?$apiKey');
  //     MovieDetail movieDetail = MovieDetail.fromJson(response.data);

  //     movieDetail.trailerId = await getYoutubeId(movieId);

  //     movieDetail.movieImage = await getMovieImage(movieId);

  //     movieDetail.castList = await getCastList(movieId);

  //     return movieDetail;
  //   } catch (error, stacktrace) {
  //     throw Exception(
  //         'Exception accoured: $error with stacktrace: $stacktrace');
  //   }
  // }

  // Future<String> getYoutubeId(int id) async {
  //   try {
  //     final response = await _dio.get('$baseUrl/movie/$id/videos?$apiKey');
  //     var youtubeId = response.data['results'][0]['key'];
  //     return youtubeId;
  //   } catch (error, stacktrace) {
  //     throw Exception(
  //         'Exception accoured: $error with stacktrace: $stacktrace');
  //   }
  // }

  // Future<MovieImage> getMovieImage(int movieId) async {
  //   try {
  //     final response = await _dio.get('$baseUrl/movie/$movieId/images?$apiKey');
  //     return MovieImage.fromJson(response.data);
  //   } catch (error, stacktrace) {
  //     throw Exception(
  //         'Exception accoured: $error with stacktrace: $stacktrace');
  //   }
  // }

  Future<List<Movie>> getMovies() async {
    try {
      var url = Uri.parse(
          '$baseUrl/movie/top_rated?api_key=$apiKey&language=en-US&page=1');
      final response = await http.get(url);
      final result = jsonDecode(response.body);
      var list = result['results'] as List;
      List<Movie> castList = list
          .map((c) => Movie(
                adult: c['adult'],
                backdropPath: c['backdrop_path'],
                genreIds: c['genreIds'],
                id: c["id"],
                originalLanguage: c["original_language"],
                originalTitle: c["original_title"],
                overview: c["overview"],
                popularity: c["popularity"],
                posterPath: c["poster_path"],
                releaseDate: c["release_date"],
                title: c["title"],
                video: c["video"],
                voteAverage: c["vote_average"],
                voteCount: c["vote_count"],
              ))
          .toList();
      return castList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<List<Movie>> getLatestMovies() async {
    try {
      var url = Uri.parse(
          'https://api.themoviedb.org/3/movie/latest?api_key=cdd513a4c476f9ad79cbe4c0eb6c8ed0&language=en-US');
      final response = await http.get(url);
      final result = jsonDecode(response.body);
      var list = result['results'] as List;
      List<Movie> castList = list
          .map((c) => Movie(
                adult: c['adult'],
                backdropPath: c['backdrop_path'],
                genreIds: c['genreIds'],
                id: c["id"],
                originalLanguage: c["original_language"],
                originalTitle: c["original_title"],
                overview: c["overview"],
                popularity: c["popularity"],
                posterPath: c["poster_path"],
                releaseDate: c["release_date"],
                title: c["title"],
                video: c["video"],
                voteAverage: c["vote_average"],
                voteCount: c["vote_count"],
              ))
          .toList();
      return castList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<List<TvShow>> getLatestShows() async {
    try {
      var url = Uri.parse(
          'https://api.themoviedb.org/3/tv/top_rated?api_key=cdd513a4c476f9ad79cbe4c0eb6c8ed0&language=en-US&page=1');
      final response = await http.get(url);
      final result = jsonDecode(response.body);
      var list = result['results'] as List;
      List<TvShow> castList = list
          .map((c) => TvShow(
                backdropPath: c["backdrop_path"],
     firstAirDate:c["first_air_date"],
     genreIds:c["genre_ids"],
     id:c["id"],
     name:c["name"], 
    originCountry:c["original_country"],
     originalLanguage:c["original_language"],
     originalName:c["original_name"],
     overview:c["overview"],
     popularity:c["popularity"],
     posterPath: c["poster_path"],
    voteAverage:c["vote_average"],
     voteCount:c["vote_count"], 
              ))
          .toList();
      return castList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }
  

  Future<List<Movie>> getSearchMovies(String name) async {
    try {
      final url = Uri.parse('https://api.themoviedb.org/3/search/movie?api_key=cdd513a4c476f9ad79cbe4c0eb6c8ed0&language=en-US&query=$name&page=1&include_adult=false');
      final response = await http.get(url);
      final result = jsonDecode(response.body);
      var list = result['results'] as List;
      List<Movie> castList = list
          .map((c) => Movie(
                adult: c['adult'],
                backdropPath: c['backdrop_path'],
                genreIds: c['genreIds'],
                id: c["id"],
                originalLanguage: c["original_language"],
                originalTitle: c["original_Title"],
                overview: c["overview"],
                popularity: c["popularity"],
                posterPath: c["poster_path"],
                releaseDate: c["release_date"],
                title: c["title"],
                video: c["video"],
                voteAverage: c["vote_average"],
                voteCount: c["voteCount"],
              ))
          .toList();
      return castList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<List<TvShow>> getSearchShows(String name) async {
    try {
      final urls=name;
      final url = Uri.parse('https://api.themoviedb.org/3/search/tv?api_key=cdd513a4c476f9ad79cbe4c0eb6c8ed0&language=en-US&page=1&query=${urls}&include_adult=false');
      final response = await http.get(url);
      final result = jsonDecode(response.body);
      var list = result['results'] as List;
      List<TvShow> castList = list
          .map((c) => TvShow(
               backdropPath: c["backdrop_path"],
     firstAirDate:c["first_air_date"],
     genreIds:c["genre_ids"],
     id:c["id"],
     name:c["name"], 
    originCountry:c["original_country"],
     originalLanguage:c["original_language"],
     originalName:c["original_name"],
     overview:c["overview"],
     popularity:c["popularity"],
     posterPath: c["poster_path"],
    voteAverage:c["vote_average"],
     voteCount:c["vote_count"],  
              ))
          .toList();
      return castList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<List<Movie>> getTrendingMovies() async {
    try {
      final url = Uri.parse('$baseUrl/trending/all/day?api_key=$apiKey');
      final response = await http.get(url);
      final result = jsonDecode(response.body);
      var list = result['results'] as List;
      List<Movie> castList = list
          .map((c) => Movie(
                adult: c['adult'],
                backdropPath: c['backdrop_path'],
                genreIds: c['genreIds'],
                id: c["id"],
                originalLanguage: c["original_language"],
                originalTitle: c["original_Title"],
                overview: c["overview"],
                popularity: c["popularity"],
                posterPath: c["poster_path"],
                releaseDate: c["release_date"],
                title: c["title"],
                video: c["video"],
                voteAverage: c["vote_average"],
                voteCount: c["voteCount"],
              ))
          .toList();
      return castList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  


  Future<List<Cast>> getCastMovies(int id) async {
    try {
      final url = Uri.parse(
          'https://api.themoviedb.org/3/movie/$id/credits?api_key=cdd513a4c476f9ad79cbe4c0eb6c8ed0&language=en-US');
      final response = await http.get(url);
      final result = jsonDecode(response.body);
      var list = result['cast'] as List;
      List<Cast> castList = list
          .map((c) => Cast(
                adult: c["adult"],
                gender: c["gender"],
                id: c["id"],
                knownForDepartment: c["known_for_department"],
                name: c["name"],
                originalName: c["original_name"],
                popularity: c["popularity"],
                profilePath: c["profile_path"],
                castId: c["cast_id"],
                character: c["character"],
              ))
          .toList();
      return castList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<List<Cast>> getCastShow(int id) async {
    try {
      final url = Uri.parse(
          'https://api.themoviedb.org/3/tv/$id/credits?api_key=cdd513a4c476f9ad79cbe4c0eb6c8ed0&language=en-US');
      final response = await http.get(url);
      final result = jsonDecode(response.body);
      var list = result['cast'] as List;
      List<Cast> castList = list
          .map((c) => Cast(
                adult: c["adult"],
                gender: c["gender"],
                id: c["id"],
                knownForDepartment: c["known_for_department"],
                name: c["name"],
                originalName: c["original_name"],
                popularity: c["popularity"],
                profilePath: c["profile_path"],
                castId: c["cast_id"],
                character: c["character"],
              ))
          .toList();
      return castList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<List<TvShow>> getShows() async {
    try {
      final url = Uri.parse(
          'https://api.themoviedb.org/3/tv/popular?api_key=$apiKey&language=en-US&page=1');
      final response = await http.get(url);
      final result = jsonDecode(response.body);
      var list = result['results'] as List;
      List<TvShow> castList = list
          .map((c) => TvShow(
                backdropPath: c["backdrop_path"],
     firstAirDate:c["first_air_date"],
     genreIds:c["genre_ids"],
     id:c["id"],
     name:c["name"], 
    originCountry:c["original_country"],
     originalLanguage:c["original_language"],
     originalName:c["original_name"],
     overview:c["overview"],
     popularity:c["popularity"],
     posterPath: c["poster_path"],
    voteAverage:c["vote_average"],
     voteCount:c["vote_count"],         
          ))
          .toList();
      return castList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<String> getVideo(int id) async {
    try {
      final url = Uri.parse(
          'https://api.themoviedb.org/3/movie/$id/videos?api_key=cdd513a4c476f9ad79cbe4c0eb6c8ed0&language=en-US');
      final response = await http.get(url);
      final result = jsonDecode(response.body);
      var list = result['results'];
      
      return list[0]["key"].toString();
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<String> getShowVideo(int id) async {
    try {
      final url = Uri.parse(
          'https://api.themoviedb.org/3/tv/$id/videos?api_key=cdd513a4c476f9ad79cbe4c0eb6c8ed0&language=en-US');
      final response = await http.get(url);
      final result = jsonDecode(response.body);
      var list = result['results'];
      
      return list[0]["key"].toString();
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }
}
