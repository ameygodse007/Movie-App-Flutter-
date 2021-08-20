import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movieapp/Services/apiService.dart';
import 'package:movieapp/model/Actor.dart';
import 'package:http/http.dart' as http;

class Actorinfo extends StatefulWidget {
  int id;
  Actorinfo({required this.id});
  static const routeName = '/actor-details';

  @override
  _ActorinfoState createState() => _ActorinfoState(id: id);
}

class _ActorinfoState extends State<Actorinfo> {
  final String imgUrl = "https://image.tmdb.org/t/p/original";
  final apiservice = ApiService();
  late Actor actor = Actor(
    adult: false,
    alsoKnownAs: [""],
    biography: "",
    birthday: "",
    gender: 0,
    homepage: "",
    id: 0,
    knownForDepartment: "",
    name: "",
    placeOfBirth: "",
    popularity: 0,
    profilePath: "",
  );
  int id;
  final String baseUrl = 'https://api.themoviedb.org/3';
  final String apiKey = 'cdd513a4c476f9ad79cbe4c0eb6c8ed0';
  _ActorinfoState({required this.id});

  Future<Actor> getActor(dynamic id) async {
    try {
      final url = Uri.parse(
          'https://api.themoviedb.org/3/person/$id?api_key=cdd513a4c476f9ad79cbe4c0eb6c8ed0&language=en-US');
      final response = await http.get(url);
      final result = jsonDecode(response.body);
      return Actor.fromJson(result);
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getActor(id);
    print(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Actor Details",
          textAlign: TextAlign.center,
        ),
      ),
      body: FutureBuilder<Actor>(
        future: getActor(id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            actor = snapshot.data!;
            dynamic altname = "";
            if (actor.alsoKnownAs != null) {
              if (actor.alsoKnownAs.length > 0) {
                altname = actor.alsoKnownAs[0];
              }
            }
            print("data===" + snapshot.data.toString());
            return Scaffold(
                backgroundColor: Color(0xFF25262E),
                body: ListView(
                  children: [
                    SizedBox(
                      height: 70,
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        alignment: Alignment.center,
                        height: 400,
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                          color: Color(0xFF171721),
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage("$imgUrl${actor!.profilePath}"),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text(
                            actor.name ?? "not available",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0),
                          ),
                          Text(
                            altname,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Container(
                                color: Color(0xFF353A4A),
                                height: 40,
                                width:
                                    actor.knownForDepartment!=null ? actor.knownForDepartment.length.toDouble() *
                                        20 : 0,
                                child: Center(
                                  child: Text(
                                    actor.knownForDepartment ?? "not available",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Container(
                                color: Color(0xFF353A4A),
                                height: 40,
                                width: actor.birthday!=null ? actor.birthday.length.toDouble() * 20 : 0,
                                child: Center(
                                  child: Text(
                                    actor.birthday ?? "not available",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Container(
                                color: Color(0xFF353A4A),
                                height: 40,
                                width:
                                    actor.placeOfBirth!=null ? actor.placeOfBirth.length.toDouble() * 10 :0,
                                child: Center(
                                  child: Text(
                                    actor.placeOfBirth ?? "not available",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 13.0),
                      child: Text(
                        "Biography",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 13.0),
                      child: Column(
                        children: [
                          Text(actor.biography ?? "not available",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    )
                  ],
                ));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
