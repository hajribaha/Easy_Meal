class detailRestaurant {

  int id;
  String nom;
  String adresse;
  dynamic  rating;
  String delivery;
  int favoris;
  static detailRestaurant _dRestaurant;


  detailRestaurant(this.id,this.nom,this.adresse,this.rating,this.delivery,this.favoris);

  detailRestaurant.fromJson(Map<String, dynamic> json) {

    this.id = json['id'];
    this.nom = json['nom'];
    this.adresse= json['adresse'];
    this.rating = json['rating'];
    this.delivery = json['delivery'];
    this.favoris = json['favoris'];
    create(id, nom, adresse, rating, delivery, favoris);
  }



  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'nom' : nom,
        'adresse' : adresse,
        'rating' : rating,
        'delivery' : delivery,
        'favoris' : favoris
      };

  int get cid => id;

  set cid(int value) {
    id = value;
  }
  String get cnom => nom;

  set cnom(String value) {
    nom = value;
  }

  String get cadresse => adresse;

  set cadresse(String value) {
    adresse = value;
  }
  double get crating => rating;

  set crating(double value) {
    rating = value;
  }
  int get cfavoris => favoris;

  set cfavoris(int value) {
    favoris = value;
  }
  static void create(int id,   String nom,String adresse ,dynamic rating,String delivery,int favoris) {
    if (_dRestaurant == null) {
      _dRestaurant = new  detailRestaurant(id, nom, adresse, rating, delivery, favoris);
      //print(_sUser.username);
    }
  }
  void cleardetailRestaurant() {
    _dRestaurant = null;
  }
  static detailRestaurant get() {
    if (_dRestaurant == null) {
      throw "_dRestaurant is null";
    }
    return _dRestaurant;
  }
  bool checkiffavoris()
  {
    if(_dRestaurant.favoris == 1)
      {
        return true;
      }else{
      return false;
    }
  }


}

