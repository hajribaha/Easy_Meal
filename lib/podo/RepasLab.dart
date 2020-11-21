import 'package:my_app/podo/Repas.dart';

class RepasLab{
  List<Repas> _repass = List();
  static RepasLab _sRepasLab;

  static RepasLab get() {
    if (_sRepasLab == null) {
      throw "_sRepasLab is null";
    }
    return _sRepasLab;
  }

  void addRepas(Repas repas) {
    _sRepasLab._repass.add(repas);
    //print(categorie.image);
  }

  Repas getRepas(int id) {
    for (Repas repas in _repass) {
      if (repas.id == id) {
        return repas;
      }
    }
    return null;
  }

  RepasLab();

  RepasLab.fromJson(List<dynamic> json) {
    _sRepasLab = RepasLab();
    for (Map<String, dynamic> categorieJson in json) {
      addRepas(Repas.fromJson(categorieJson));
    }
  }

  List<Repas> get repass => _repass;
  void clearRepass() {
    _sRepasLab = null;
  }
}