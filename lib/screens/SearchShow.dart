import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:movieapp/Services/apiService.dart';
import 'package:movieapp/model/TvShow.dart';
import 'package:movieapp/widget/vertical_list_item.dart';

class SearchShows extends StatefulWidget {
  SearchShows({Key? key}) : super(key: key);

  @override
  _SearchShowsState createState() => _SearchShowsState();
}

class _SearchShowsState extends State<SearchShows> {
  ApiService apiservice = ApiService();
  String name = "";
  late List<TvShow> movies=[];
  
      changeMovie(List<TvShow> a){
        setState(() {
          movies=a;
        });
      }
  late SearchBar searchBar = new SearchBar(
      inBar: false,
      setState: setState,
      onChanged: (String name) {
        setState(() {
          name = name;
        });
      },
      onSubmitted: (String search) {
        apiservice.getSearchShows(search).then((movies)=>{
          changeMovie(movies)
        });
      },
      buildDefaultAppBar: buildAppBar);

  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
        title: new Text('Search '),
        actions: [searchBar.getSearchAction(context)]);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFF171721),
      resizeToAvoidBottomInset: false,
      appBar: searchBar.build(context),
      body: SingleChildScrollView(
        child: FractionallySizedBox(
          child: Container(
              height: 800,
              child: movies != null
                  ? GridView.builder(
                            //Now let's create our custom List tile
                            scrollDirection: Axis.vertical,
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 3 / 5.6,
                            ),

                            itemCount: movies.length,
                            itemBuilder: (context, index) =>
                                VerticalListItem(movies[index]),
                          )
                  : Center(child:Text("Ki"))),
        ),
      ),
    );
  }
}
