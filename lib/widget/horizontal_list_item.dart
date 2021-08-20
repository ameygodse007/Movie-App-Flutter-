import 'package:flutter/material.dart';

import 'package:movieapp/screens/movie_details_screen.dart';

import '../model/movie.dart';

class HorizontalListItem extends StatelessWidget {
  final Movie index;
  final String imgUrl = "https://image.tmdb.org/t/p/original";
  HorizontalListItem(this.index);
  @override
  Widget build(BuildContext context) {
    return Container(

      padding: const EdgeInsets.all(10),
  
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            MovieDetailsScreen.routeName,
            arguments: Movie(
              adult: index.adult,
                backdropPath: index.backdropPath,
                genreIds: index.genreIds,
                id: index.id,
                originalLanguage: index.originalLanguage,
                originalTitle: index.originalTitle,
                overview: index.overview,
                popularity: index.popularity,
                posterPath: index.posterPath,
                releaseDate: index.releaseDate,
                title: index.title,
                video: index.video,
                voteAverage: index.voteAverage,
                voteCount: index.voteCount,
            ),
            
          );
          print("$imgUrl${index.backdropPath}");
        },
        child: Container(
          height: 300,
          child: Column(
            children: <Widget>[
              Card(
                shape: BeveledRectangleBorder(
    borderRadius: BorderRadius.circular(10.0),
  ),
                elevation: 10,
                child: Hero(
                  tag: index.id,
                  child: Container(
                    height: 200,
                    width:150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                         fit: BoxFit.cover,
                         image: NetworkImage("$imgUrl${index.posterPath}"),
                       ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                index.title ?? "",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                index.releaseDate ?? "",
                style: TextStyle(
                  fontSize: 14,
                  
                  color: Colors.white54
                ),
                textAlign: TextAlign.center,
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
