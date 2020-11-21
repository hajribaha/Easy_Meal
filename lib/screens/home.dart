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
import 'package:my_app/screens/dishes.dart';
import 'package:my_app/widgets/grid_product.dart';
import 'package:my_app/widgets/home_category.dart';
import 'package:my_app/widgets/slider_item.dart';
import 'package:my_app/util/foods.dart';
import 'package:my_app/util/categories.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin<Home>{
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  int _current = 0;
  List<Categorie> ca = CategorieLab.get().categories;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(

      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0,0,10.0,0),
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Dishes",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                FlatButton(
                  child: Text(
                    "View More",
                    style: TextStyle(
//                      fontSize: 22,
//                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  onPressed: (){
                    fetchdetailRestaurants();
                    if(detailRestaurant.get() !=null)
                      {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context){
                              return DishesScreen();
                            },
                          ),
                        );
                      }else{
                      fetchdetailRestaurants();
                    }

                  },
                ),
              ],
            ),

            SizedBox(height: 10.0),

            //Slider Here

            CarouselSlider(
              height: MediaQuery.of(context).size.height/2.4,
              items: map<Widget>(
                foods,
                    (index, i){
                      Map food = foods[index];
                  return SliderItem(
                    img: food['img'],
                    isFav: false,
                    name: food['name'],
                    rating: 5.0,
                    raters: 23,
                  );
                },
              ).toList(),
              autoPlay: true,
//                enlargeCenterPage: true,
              viewportFraction: 1.0,
//              aspectRatio: 2.0,
              onPageChanged: (index) {
                setState(() {
                  _current = index;
                });
              },
            ),
            SizedBox(height: 20.0),

            Text(
              "Food Categories",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 10.0),

            Container(
              height: 65.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,

              itemCount: ca == null?0:ca.length,
                itemBuilder: (BuildContext context, int index) {
                  Categorie cat = ca[index];

                  return HomeCategory(
                    icon:FontAwesomeIcons.image ,//cat['icon']
                    title: cat.nom,
                    items:"05" ,//cat['items'].toString()
                    isHome: true,
                  );
                },
              ),
            ),

            SizedBox(height: 20.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Popular Items",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                FlatButton(
                  child: Text(
                    "View More",
                    style: TextStyle(
//                      fontSize: 22,
//                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  onPressed: (){},
                ),
              ],
            ),
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
              itemCount: foods == null ? 0 :foods.length,
              itemBuilder: (BuildContext context, int index) {
//                Food food = Food.fromJson(foods[index]);
                Map food = foods[index];
//                print(foods);
//                print(foods.length);
                return GridProduct(
                  img: food['img'],
                  isFav: false,
                  name: food['name'],
                  rating: 5.0,
                  raters: 23,
                );
              },
            ),

            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }


  @override
  bool get wantKeepAlive => true;
////////////
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
