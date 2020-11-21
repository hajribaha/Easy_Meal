class Repas {
  int id;
  String nom;
  String description;
  dynamic prix;
  int id_restau;

  Repas(this.id,this.nom,this.description,this.prix,this.id_restau);

  Repas.fromJson(Map<String, dynamic> json) {

    this.id = json['id'];
    this.nom = json['nom'];
    this.description = json['description'];
    this.prix = json['prix'];
    this.id_restau =json['id_restau'];
  }

  Map<String, dynamic> toJson () {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] =this.id;
    data['nom'] =this.nom;
    data['description'] =this.description;
    data['prix'] =this.prix;
    data['id_restau'] =this.id_restau;
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
  String get cdescription => description;

  set cdescription(String value) {
    description = value;
  }

  dynamic get cprix => prix;

  set cprix(dynamic value) {
    prix = value;
  }
  int get cid_restau => id_restau;

}