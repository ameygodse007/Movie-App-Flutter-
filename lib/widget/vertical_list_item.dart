import 'package:flutter/material.dart';
import 'package:movieapp/model/TvShow.dart';
import 'package:movieapp/screens/showdetailscreen.dart';

import '../model/movie.dart';
import '../screens/movie_details_screen.dart';

class VerticalListItem extends StatelessWidget {
  final TvShow index;
  final String imgUrl = "https://image.tmdb.org/t/p/original";
  VerticalListItem(this.index);
  @override
  Widget build(BuildContext context) {
    return Container(

      padding: const EdgeInsets.all(10),
  
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            ShowDetailsScreen.routeName,
            arguments: TvShow(
              backdropPath: index.backdropPath,
     firstAirDate:index.firstAirDate,
     genreIds:index.genreIds,
     id:index.id,
     name:index.name, 
    originCountry:index.originCountry,
     originalLanguage:index.originalLanguage,
     originalName: index.originalName,
     overview:index.overview,
     popularity:index.popularity,
     posterPath: index.posterPath,
    voteAverage:index.voteAverage,
     voteCount:index.voteCount, 
            ),
            
          );
          print("$imgUrl${index.backdropPath}");
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.01,
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
                         fit: BoxFit.fitWidth,
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
                index.name ?? "",
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
                index.firstAirDate.toString() ?? "",
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
