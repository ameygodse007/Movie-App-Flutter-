import 'package:flutter/material.dart';
import 'package:movieapp/Services/apiService.dart';
import 'package:movieapp/model/TvShow.dart';
import 'package:movieapp/model/cast_list.dart';
import 'package:movieapp/model/movie.dart';
import 'package:movieapp/screens/Actorinfo.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowDetailsScreen extends StatefulWidget {
  static const routeName = '/show-details';

  @override
  _ShowDetailsScreenState createState() => _ShowDetailsScreenState();
}

class _ShowDetailsScreenState extends State<ShowDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as TvShow;
    final apiservice = ApiService();
    final cast = apiservice.getCastMovies(routeArgs.id);
    final id = routeArgs.id;
    final rating = routeArgs.voteAverage;
    final String imgUrl = "https://image.tmdb.org/t/p/original";

    Future<void> watchTralier(String url) async {
      final String basic = "https://www.youtube.com/watch?v=";

      print("++++++++++++++++++URL " + url.toString());
      if (await canLaunch(basic + url)) {
        await launch(basic + url,
            forceSafariVC: true,
            forceWebView: false,
            headers: <String, String>{"header_key": "header_value"});
      } else {
        throw "Could not launch tralier.";
      }
    }

    return Scaffold(
      backgroundColor: Color(0xfff4f4f4),
      appBar: AppBar(
        // title: Text('Movie Details'),
        backgroundColor: Color(0xfff4f4f4),
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: Column(
          children: <Widget>[
            Center(
              child: Card(
                elevation: 10,
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Hero(
                  tag: id.toString(),
                  child: Container(
                    height: 450,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "$imgUrl${routeArgs.posterPath}",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              routeArgs.name.toString(),
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.5,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 65,
                          child: Tab(
                            icon: Image.network(
                                "https://img.icons8.com/color/452/18-plus.png"),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.calendar_today,
                          size: 35,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          routeArgs.firstAirDate.toString(),
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.star_border,
                          size: 35,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '$rating/10',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Cast",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
            ),
            SizedBox(
              height: 7.0,
            ),
            Container(
              height: 100,
              child: FutureBuilder(
                future: apiservice.getCastMovies(routeArgs.id),
                builder:
                    (BuildContext context, AsyncSnapshot<List<Cast>> snapshot) {
                  //let's check if we got a response or not
                  if (snapshot.hasData) {
                    //Now let's make a list of articles
                    List<Cast>? articles = snapshot.data;

                    return ListView.builder(
                      //Now let's create our custom List tile
                      scrollDirection: Axis.horizontal,
                      itemCount: articles!.length,
                      itemBuilder: (context, index) => Container(
                          height: 90,
                          width: 90,
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  print("++++++++" +
                                      articles[index].id.toString());
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Actorinfo(id: articles[index].id)),
                                  );
                                },
                                child: CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage: articles[index]
                                              .profilePath !=
                                          null
                                      ? NetworkImage(
                                          "https://image.tmdb.org/t/p/original${articles[index].profilePath}")
                                      : NetworkImage(
                                          "http://www.newecology.org/wp-content/uploads/2016/03/default-profile-picture-768x768.jpg"),
                                  backgroundColor: Colors.transparent,
                                ),
                              ),
                              SizedBox(
                                height: 7.0,
                              ),
                              Text(
                                "${articles[index].name}",
                                textAlign: TextAlign.center,
                              )
                            ],
                          )),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              routeArgs.overview.toString(),
              style: TextStyle(
                fontSize: 18,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        children: <Widget>[
          Expanded(
            child: RaisedButton(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 20,
              ),
              onPressed: () {},
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              child: GestureDetector(
                onTap: () {
                  String a;
                  apiservice.getShowVideo(id).then((String result) {
                    watchTralier(result ?? "");
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(
                      Icons.play_circle_outline,
                    ),
                    Text(
                      'Watch Trailer',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: RaisedButton(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 20,
              ),
              onPressed: () {},
              color: Colors.yellowAccent,
              textColor: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.check_circle_outline,
                  ),
                  Container(
                    height: 5,
                    width: 5,
                  ),
                  Text(
                    'Buy Now',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
