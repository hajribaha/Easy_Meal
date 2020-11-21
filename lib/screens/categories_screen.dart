import 'dart:convert';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_app/podo/Categorie.dart';
import 'package:my_app/podo/CategorieLab.dart';
import 'package:my_app/podo/Restaurant.dart';
import 'package:my_app/podo/RestaurantLab.dart';
import 'package:my_app/podo/User.dart';
import 'package:my_app/screens/notifications.dart';
import 'package:my_app/util/Icon.dart';
import 'package:my_app/util/categories.dart';
import 'package:my_app/util/foods.dart';
import 'package:my_app/widgets/badge.dart';
import 'package:my_app/widgets/grid_product.dart';
import 'package:my_app/widgets/home_category.dart';
import 'package:http/http.dart' as http;

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  //List<Categorie> ca = CategorieLab.get().categories;
  //List<Restaurant> ra = RestaurantLab.get().restaurants;
  String catie = "";
  bool b = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_backspace,
          ),
          onPressed: ()=>Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          "Categories",
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: IconBadge(
              icon: Icons.notifications,
              size: 22.0,
            ),
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context){
                    return Notifications();
                  },
                ),
              );
            },
          ),
        ],
      ),

      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0,0,10.0,0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10.0),
            Container(
              height: 65.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: CategorieLab.get().categories.length,
                itemBuilder: (BuildContext context, int index) {
                  //Map cat = categories[index];
                  Categorie cat = CategorieLab.get().categories[index];
                  return HomeCategory(
                    icon:FontAwesomeIcons.image,
                    title: cat.nom,
                    items: "05" ,//cat['items'].toString()
                    isHome: false,
                    tap: (){
                      setState((){
                        catie = cat.nom;
                        //RestaurantLab.get().clearRestaurants();
                        //Scaffold.of(context);
                        fetchRestaurants(cat.nom, User.get().username);
                       // Scaffold.of(context);
                      });
                    },
                  );
                },
              ),
            ),

            SizedBox(height: 20.0),

            Text(
              "$catie",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w800,
              ),
            ),
            Divider(),
            SizedBox(height: 10.0),

            GridView.builder(
              shrinkWrap: true,
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.25),
              ),
              itemCount:RestaurantLab.get().restaurants.length,
              itemBuilder: (BuildContext context, int index) {
                //  Map food = foods[index];
               // RestaurantLab.get().clearRestaurants();
                Restaurant res = RestaurantLab.get().restaurants[index];

                if (res.favoris == 1)
                {
                  b = true;
                }else{
                  b= false;
                }
                return GridProduct(
                  img: 'assets/'+res.nom+'.jpg',//food['img']
                  isFav:b,
                  name: res.nom,//food['name']
                  rating:res.rating.toDouble(),
                  raters: res.id,

                );

              },
            ),

          ],
        ),
      ),
    );
  }

  fetchRestaurants(nomcategorie,nomuser) async {
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
          'userfavoris':nomuser,

        }),
      );
      if (response.statusCode == 200) {
        // If the call to the server was successful, parse the JSON to get user data
        /* print("************************");
        print("response"+response.body);
        print("**************************");*/
        RestaurantLab.fromJson(json.decode(response.body));
        List<Restaurant> ca = RestaurantLab.get().restaurants;
        print(ca[0].nom);
      } else {
        print('Cannot fetch Restaurants from servers');
      }
    } catch (e) {
      print('Cannot fetch Restaurants from servers :'+e.toString());
    }
  }
}
