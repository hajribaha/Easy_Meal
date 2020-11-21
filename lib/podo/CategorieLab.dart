import 'Categorie.dart';
class CategorieLab {
  List<Categorie> _categories = List();
  static CategorieLab _sCategorieLab;

  static CategorieLab get() {
    if (_sCategorieLab == null) {
      throw "_sCategorieLab is null";
    }
    return _sCategorieLab;
  }

  void addCategorie(Categorie categorie) {
    _sCategorieLab._categories.add(categorie);
    //print(categorie.image);
  }

  Categorie getCategorie(int id) {
    for (Categorie categorie in _categories) {
      if (categorie.id == id) {
        return categorie;
      }
    }
    return null;
  }

  CategorieLab();

  CategorieLab.fromJson(List<dynamic> json) {
    _sCategorieLab = CategorieLab();
    for (Map<String, dynamic> categorieJson in json) {
      addCategorie(Categorie.fromJson(categorieJson));
    }
  }

  List<Categorie> get categories => _categories;
  void clearCategorie() {
    _sCategorieLab = null;
  }
}

