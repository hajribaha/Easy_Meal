class Restaurant {

  int id;
  String nom;
  String adresse;
  dynamic  rating;
  String delivery;
  int favoris;

  Restaurant(this.id,this.nom);

  Restaurant.fromJson(Map<String, dynamic> json) {

    this.id = json['id'];
    this.nom = json['nom'];
    this.adresse= json['adresse'];
    this.rating = json['rating'];
    this.delivery = json['delivery'];
    this.favoris = json['favoris'];

  }

  Map<String, dynamic> toJson () {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] =this.id;
    data['nom'] =this.nom;
    data['adresse'] =this.adresse;
    data['rating'] =this.rating;
    data['favoris'] =this.favoris;
    return data;
  }

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

}

