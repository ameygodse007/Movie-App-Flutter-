import 'package:flutter/material.dart';
import 'package:movieapp/Services/apiService.dart';
import 'package:movieapp/model/TvShow.dart';
import 'package:movieapp/screens/SearchScreen.dart';

import '../model/movie.dart';

import '../widget/top_rated_list_item.dart';
import '../widget/vertical_list_item.dart';
import '../widget/horizontal_list_item.dart';
import 'SelectOption.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {

    final apiservice = ApiService();
    late Future<List<Movie>> article;
    
        
    return Scaffold(
      backgroundColor: Color(0xFF171721),
      appBar: AppBar(
        title: Text('Movies App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    Select()),
           );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Recommended',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                ],
              ),
            ),
            Container(
              height: 300,
              child: FutureBuilder(
                future: apiservice.getMovies(),
               builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
          //let's check if we got a response or not
          if (snapshot.hasData) {
            //Now let's make a list of articles
            List<Movie>? articles = snapshot.data;
            return ListView.builder(
              //Now let's create our custom List tile
              scrollDirection: Axis.horizontal,
              itemCount: articles!.length,
              itemBuilder: (context, index) =>
                  HorizontalListItem(articles[index]),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Trending',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                ],
              ),
            ),
            Container(
              height: 280,
              child: FutureBuilder(
                future: apiservice.getTrendingMovies(),
               builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
          //let's check if we got a response or not
          if (snapshot.hasData) {
            //Now let's make a list of articles
            List<Movie>? articles = snapshot.data;
            return ListView.builder(
              //Now let's create our custom List tile
              scrollDirection: Axis.horizontal,
              itemCount: articles!.length,
              itemBuilder: (context, index) =>
                  HorizontalListItem(articles[index]),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Popular TV Show',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                ],
              ),
            ),
            Container(
              height: 280,
              child: FutureBuilder(
                future: apiservice.getShows(),
               builder: (BuildContext context, AsyncSnapshot<List<TvShow>> snapshot) {
          //let's check if we got a response or not
          if (snapshot.hasData) {
            //Now let's make a list of articles
            List<TvShow>? articles = snapshot.data;
            return ListView.builder(
              //Now let's create our custom List tile
              scrollDirection: Axis.horizontal,
              itemCount: articles!.length,
              itemBuilder: (context, index) =>
                  VerticalListItem(articles[index]),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
              ),
            ),
            SizedBox(height: 10.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Latest TV Show',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                ],
              ),
            ),
            Container(
              height: 300,
              child: FutureBuilder(
                future: apiservice.getLatestShows(),
               builder: (BuildContext context, AsyncSnapshot<List<TvShow>> snapshot) {
          //let's check if we got a response or not
          if (snapshot.hasData) {
            //Now let's make a list of articles
            List<TvShow>? articles = snapshot.data;
            return ListView.builder(
              //Now let's create our custom List tile
              scrollDirection: Axis.horizontal,
              itemCount: articles!.length,
              itemBuilder: (context, index) =>
                  VerticalListItem(articles[index]),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
