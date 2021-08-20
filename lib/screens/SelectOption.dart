import 'package:flutter/material.dart';
import 'package:movieapp/screens/SearchShow.dart';

import 'SearchScreen.dart';

class Select extends StatelessWidget {
  const Select({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Movie Details'),
        backgroundColor: Color(0xfff4f4f4),
        elevation: 0,
        title: Text("Select Category",style: TextStyle(color:Theme.of(context).primaryColor),),
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      ),
      body: Center(
      child: Row(
          mainAxisSize: MainAxisSize.max,
          
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            
            GestureDetector(
              onTap: (){
                Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    SearchScreen()),
           );
              },
              child: Container(
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Theme.of(context).primaryColor,),
                height: 200,
                width: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                            Icons.movie,
                            size: 35,
                            color: Colors.white,
                          ),
                          Text("Movies",style:TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ))
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    SearchShows()),
           );
              },
              child: Container(
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Theme.of(context).primaryColor,),
                height: 200,
                width: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                            Icons.tv,
                            size: 35,
                            color: Colors.white,
                          ),
                          Text("TV Seasons",style:TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ))
                  ],
                ),
              ),
            )
          ],
        ),
    ),
    );
  }
}