import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ListPage extends StatelessWidget {
  Future<List>getNameList() async{
    http.Response response=await http.get("https://jsonplaceholder.typicode.com/users");
    return json.decode(response.body);
  }
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Http Call Demo")
      ),
      body: Container(
        child: FutureBuilder(
          future: getNameList(),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot){
           if(!snapshot.hasData) return Center(
              child: CircularProgressIndicator(),
            );
            // if (snapshot.hasError) return Center(
            //   child: Text("There is some error getting data from the internet."),
            // );
             
             List users =snapshot.data;
             
             return ListView.builder(
               padding:EdgeInsets.all(20.0), 
               itemCount: users.length,
               itemBuilder: (BuildContext context, int index){
                 var user = users[index];
                 return ListTile(
                 title: Text(users[index]['name']),
                 subtitle: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: <Widget>[
                     Text(user['email']),
                     SizedBox(height: 9.0,),
                     Text(user['phone'])
                   ],
                 ),
                 );
               }
             );
               


          },
        ),
      ),
    );
  }
}
