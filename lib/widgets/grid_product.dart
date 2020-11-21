import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_app/podo/Repas.dart';
import 'package:my_app/podo/RepasLab.dart';
import 'package:my_app/podo/User.dart';
import 'package:my_app/podo/detailRestaurant.dart';
import 'package:my_app/screens/details.dart';
import 'package:my_app/util/const.dart';
import 'package:my_app/widgets/smooth_star_rating.dart';
import 'package:http/http.dart' as http;

class GridProduct extends StatelessWidget {

  final String name;
  final String img;
  final bool isFav;
  final dynamic rating;
  final int raters;



  GridProduct({
    Key key,
    @required this.name,
    @required this.img,
    @required this.isFav,
    @required this.rating,
    @required this.raters})
      :super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListView(
        shrinkWrap: true,
        primary: false,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 3.6,
                width: MediaQuery.of(context).size.width / 2.2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    "$img",
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Positioned(
                right: -10.0,
                bottom: 3.0,
                child: RawMaterialButton(
                  onPressed: (){},
                  fillColor: Colors.white,
                  shape: CircleBorder(),
                  elevation: 4.0,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(
                      isFav
                          ?Icons.favorite
                          :Icons.favorite_border,
                      color: Colors.red,
                      size: 17,
                    ),
                  ),
                ),
              ),
            ],


          ),

          Padding(
            padding: EdgeInsets.only(bottom: 2.0, top: 8.0),
            child: Text(
              "$name",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w900,
              ),
              maxLines: 2,
            ),
          ),

          Padding(
            padding: EdgeInsets.only(bottom: 5.0, top: 2.0),
            child: Row(
              children: <Widget>[
                SmoothStarRating(
                  starCount: 5,
                  color: Constants.ratingBG,
                  allowHalfRating: true,
                  rating: rating,
                  size: 10.0,
                ),

                Text(
                  " $rating ($raters Reviews)",
                  style: TextStyle(
                    fontSize: 11.0,
                  ),
                ),

              ],
            ),
          ),


        ],
      ),

      onTap: (){
        //detailRestaurant.get().cleardetailRestaurant();
        fetchdetailRestaurants();
        if(detailRestaurant.get() !=null )
          {
            fetchdetailRestaurants();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context){
                  return ProductDetails();
                },
              ),
            );
          }else{
          fetchdetailRestaurants();
        }

      },
    );
  }
  fetchdetailRestaurants() async {

   // var url = "http://192.168.1.52:4000/getAllRestwithCat/"+raters.toString()+"/"+User.get().username; // iOS
    var url =  "http://192.168.1.52:4000/getRestwithId/"+raters.toString()+"/"+User.get().username;
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

}
