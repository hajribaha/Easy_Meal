import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_app/podo/Categorie.dart';
import 'package:my_app/podo/CategorieLab.dart';
import 'package:my_app/podo/RepasLab.dart';
import 'package:my_app/podo/Restaurant.dart';
import 'package:my_app/podo/RestaurantLab.dart';
import 'package:my_app/podo/User.dart';
import 'package:my_app/podo/detailRestaurant.dart';
import 'package:my_app/screens/main_screen.dart';
import 'package:http/http.dart' as http;


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _usernameControl = new TextEditingController();
  final TextEditingController _passwordControl = new TextEditingController();
  final TextEditingController _controller = TextEditingController();
  Widget signIn = Text("Sign In");

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.0,0,20,0),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[

          SizedBox(height: 10.0),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              top: 25.0,
            ),
            child: Text(
              "Log in to your account",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),

          SizedBox(height: 30.0),

          Card(
            elevation: 3.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: TextField(
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Colors.white,),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white,),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  hintText: "Username",
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                  prefixIcon: Icon(
                    Icons.perm_identity,
                    color: Colors.black,
                  ),
                ),
                maxLines: 1,
                controller: _usernameControl,
              ),
            ),
          ),

          SizedBox(height: 10.0),

          Card(
            elevation: 3.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: TextField(
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Colors.white,),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white,),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  hintText: "Password",
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: Colors.black,
                  ),
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
                obscureText: true,
                maxLines: 1,
                controller: _passwordControl,
              ),
            ),
          ),

          SizedBox(height: 10.0),

          Container(
            alignment: Alignment.centerRight,
            child: FlatButton(
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).accentColor,
                ),
              ),
              onPressed: (){},
            ),
          ),

          SizedBox(height: 30.0),

          Container(
            height: 50.0,
            child: RaisedButton(
              child: Text(
                "LOGIN".toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: (){  

              /*  Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context){
                      return MainScreen();
                    },
                  ),
                );*/
                setState(() {
                  signIn = FutureBuilder(

                    future: loginUser(_usernameControl.text,_passwordControl.text),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Text("Sign In");
                      }

                      // By default, show a loading spinner
                      return CircularProgressIndicator();
                    },
                  );
                });
              },
              color: Theme.of(context).accentColor,
            ),
          ),

          SizedBox(height: 10.0),
          Divider(color: Theme.of(context).accentColor,),
          SizedBox(height: 10.0),


          Center(
            child: Container(
              width: MediaQuery.of(context).size.width/2,
              child: Row(
                children: <Widget>[
                  RawMaterialButton(
                    onPressed: (){},
                    fillColor: Colors.blue[800],
                    shape: CircleBorder(),
                    elevation: 4.0,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Icon(
                        FontAwesomeIcons.facebookF,
                        color: Colors.white,
//              size: 24.0,
                      ),
                    ),
                  ),

                  RawMaterialButton(
                    onPressed: (){},
                    fillColor: Colors.white,
                    shape: CircleBorder(),
                    elevation: 4.0,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Icon(
                        FontAwesomeIcons.google,
                        color: Colors.blue[800],
//              size: 24.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 20.0),

        ],
      ),
    );
  }


   loginUser( email, password) async {
    String message = "";

    try {
      var url = "http://192.168.1.52:4000/login1/"; // iOS
      final http.Response response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode (<String, String>{
          'email':email,
          'password': password,

        }),
      );
      if (response.statusCode == 200) {
        print(json.decode(response.body));
        Map userMap = jsonDecode(response.body);
        var user = User.fromJson(userMap );
        print(user.userId);
        fetchCategories();
        fetchRestaurants("pizza", user.username.toString());
       fetchdetailRestaurantsRepas("1");
        fetchdetailRestaurants();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context){
              return MainScreen();
            },
          ),
        );
      }else if (response.statusCode == 301) {
        message = ' Incorrect Password or email';
      }
      else {
        throw Exception('Failed to create User :' + response.body.toString());
      }

    } catch (e) {
      message = 'Cannot connect to server';
      throw Exception(' Error :' + e);

    }
    if (message != "") {
      final snackBar =
      SnackBar(content: Text(message), duration: Duration(seconds: 2));
      Scaffold.of(context).showSnackBar(snackBar);
    }
  }

  fetchCategories() async {
    http.Response response;
    try {
      response = await http.get(
          "http://192.168.1.52:4000/getAllCat/");
      if (response.statusCode == 200) {
        // If the call to the server was successful, parse the JSON to get user data
        print("************************");
        print("response"+response.body);
        print("**************************");
        CategorieLab.fromJson(json.decode(response.body));
          List<Categorie> ca = CategorieLab.get().categories;
          print("categorie: "+ca[1].nom.toString());
      } else {
        print('Cannot fetch Categories from servers');
      }
    } catch (e) {
     print('Cannot fetch Categories from servers'+e);
    }
  /*  if (message != "") {
      final snackBar =
      SnackBar(content: Text(message), duration: Duration(seconds: 2));
      Scaffold.of(context).showSnackBar(snackBar);
    }*/
  }

  fetchRestaurants(nomcategorie,nomuser) async {
    String message = "";
    var url = "http://192.168.1.52:4000/getAllRestwithCat/"; // iOS
    try
    {

      final http.Response response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode (<String, String>{
          'value':nomcategorie,
          'userfavoris': nomuser,

        }),
      );
      if (response.statusCode == 200) {
        // If the call to the server was successful, parse the JSON to get user data
        print("************************");
        print("response"+response.body);
        print("**************************");
        RestaurantLab.fromJson(json.decode(response.body));
           List<Restaurant> ca = RestaurantLab.get().restaurants;
          print("Restaurant"+ca[1].nom.toString());

          print('Fetch Restaurant success');
      } else {
         print('Cannot fetch Restaurants from servers');
      }
    } catch (e) {
      print('Cannot fetch Restaurants from servers'+e);
    }
    /*
    if (message != "") {
      final snackBar =
      SnackBar(content: Text(message), duration: Duration(seconds: 2));
      Scaffold.of(context).showSnackBar(snackBar);
    }*/
  }

  fetchdetailRestaurantsRepas(String id_restaus) async {

    // var url = "http://192.168.1.52:4000/getAllRestwithCat/"+raters.toString()+"/"+User.get().username; // iOS
    var url =  "http://192.168.1.52:4000/getAllRepaswithId/"+id_restaus;
    try
    {

      final http.Response response = await http.get(
          url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          }
      );
      if (response.statusCode == 200) {
        // If the call to the server was successful, parse the JSON to get user data
        print("************************");
        print("response"+response.body);
        print("**************************");
        RepasLab.fromJson(json.decode(response.body));

        print("Repas :"+RepasLab.get().repass[0].nom);

        print('Fetch RepasLab success');
      } else {
        print('Cannot fetch RepasLab from servers');
      }
    } catch (e) {
      print('Cannot fetch RepasLab from servers :'+e.toString());
    }
  }
  ///////////////////////////////
  fetchdetailRestaurants() async {

    // var url = "http://192.168.1.52:4000/getAllRestwithCat/"+raters.toString()+"/"+User.get().username; // iOS
    var url =  "http://192.168.1.52:4000/getRestwithId/1/"+User.get().username;
    try
    {

      final http.Response response = await http.get(
          url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          }
      );
      if (response.statusCode == 200) {
        // If the call to the server was successful, parse the JSON to get user data
        print("************************");
        print("response"+response.body);
        print("**************************");
        detailRestaurant.fromJson(json.decode(response.body));
        fetchdetailRestaurantsRepas(detailRestaurant.get().id.toString());

        print("Restaurant :"+detailRestaurant.get().nom);

        print('Fetch detailRestaurant success');
      } else {
        print('Cannot fetch detailRestaurants from servers');
      }
    } catch (e) {
      print('Cannot fetch detailRestaurants from servers :'+e.toString());
    }
  }
}
