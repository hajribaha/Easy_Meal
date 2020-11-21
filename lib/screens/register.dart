import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_app/screens/login.dart';
import 'package:my_app/screens/main_screen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _validateEmail(String value) {
    final RegExp emailRegEx= RegExp("^([0-9a-zA-Z]([-.+\\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\\w]*[0-9a-zA-Z]\\.)+[a-zA-Z]{2,9})\$");
    if (!emailRegEx.hasMatch(value)) {
      return 'The E-mail Address must be a valid.';
    }
    return null;
  }
  final TextEditingController _usernameControl = new TextEditingController();
  final TextEditingController _emailControl = new TextEditingController();
  final TextEditingController _passwordControl = new TextEditingController();
  bool _buttonEnabled = true;
  final  _formKey = GlobalKey<FormState>();
  final  _formKey2 = GlobalKey<FormState>();
  final  _formKey3 = GlobalKey<FormState>();
  final  _formKey4 = GlobalKey<FormState>();
  Widget _register = Text("Register");

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
              "Create an account",
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
            child: new Form(
              key: _formKey,
              autovalidate: true,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: new TextFormField(
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
                  prefixIcon: Icon(
                    Icons.perm_identity,
                    color: Colors.black,
                  ),
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
                maxLines: 1,
                controller: _usernameControl,
                  validator: (value) {
                    if (value.length < 4) {
                      return 'Enter a username that is at least 4 characters long';
                    } else if (value.length > 29) {
                      return 'Enter a username that is at least 4 characters long';
                    }
                  }
              ),
            ),
            ),
            ),

          SizedBox(height: 10.0),

          Card(
            elevation: 3.0,
            child: new Form(
              key: _formKey2,
              autovalidate: true,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: new TextFormField(
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
                  hintText: "email",
                  prefixIcon: Icon(
                    Icons.mail_outline,
                    color: Colors.black,
                  ),
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
                maxLines: 1,
                controller: _emailControl,
                validator: _validateEmail,

              ),
            ),
          ),
          ),

          SizedBox(height: 10.0),

          Card(
            elevation: 3.0,
            child: new Form(
              key: _formKey3,
              autovalidate: true,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: new TextFormField(
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
                keyboardType: TextInputType.text,
                  maxLines: 1,
                  controller: _passwordControl,
                  validator: (value) {
                    if (value.length < 6) {
                      return 'Enter a password that is at least 6 characters long';
                    } else if (value.length > 29) {
                      return 'Enter a password that is at most 29 characters long';
                    }
                  }
              ),
            ),
          ),
          ),


          SizedBox(height: 40.0),

          Container(
            height: 50.0,
            child: new Form(
              key: _formKey4,
              autovalidate: true,
            child: RaisedButton(
              child: Text(
                "Register".toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: (){
                //print("***************");
                //print(_usernameControl.text);


                /*Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context){
                      return LoginScreen();
                    },
                  ),
                );*/
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate() && _formKey2.currentState.validate() && _formKey3.currentState.validate() && _formKey4.currentState.validate() && _buttonEnabled) {
                  _formKey.currentState.save();
                  setState(() {
                    _register = FutureBuilder(

                      future: signup(_emailControl.text,_passwordControl.text,_usernameControl.text),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          _buttonEnabled = true;
                          return Text("Created User");
                        }
                        // By default, show a loading spinner and disable button
                        _buttonEnabled = false;
                        return CircularProgressIndicator();
                      }

                    );
                  }
                  );
                }
              },
              color: Theme.of(context).accentColor,
            ),
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

  signup(email, password ,username) async {
    String message = "";
    var url = "http://192.168.1.52:4000/register/"; // iOS
    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode (<String, String>{
        'name':username,
        'email':email,
        'password': password,

      }),
    );

    if (response.statusCode == 201) {
      message = ' User Created ';
    }else if (response.statusCode == 202) {
      message = ' User Already Exist';
    }
    else {
      throw Exception('Failed to create User :' + response.body.toString());
    }

    if (message != "") {
      final snackBar =
      SnackBar(content: Text(message), duration: Duration(seconds: 2));
      Scaffold.of(context).showSnackBar(snackBar);
    }

  }
}
