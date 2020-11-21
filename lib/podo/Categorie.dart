class Categorie {

  int id;
  String nom;

  Categorie(this.id,this.nom);

  Categorie.fromJson(Map<String, dynamic> json) {

    this.id = json['id'];
    this.nom = json['nom'];
  }

  Map<String, dynamic> toJson () {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] =this.id;
    data['nom'] =this.nom;
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
}

