import 'package:my_app/podo/Restaurant.dart';

class RestaurantLab {
  List<Restaurant> _restaurants = List();
  static RestaurantLab _sRestaurantLab;

  static RestaurantLab get() {
    if (_sRestaurantLab == null) {
      throw "_sRestaurantLab is null";
    }
    return _sRestaurantLab;
  }

  void addRestaurant( Restaurant restaurant) {
    _sRestaurantLab._restaurants.add(restaurant);
    //print(categorie.image);
  }

  Restaurant getRestaurant(int id) {
    for (Restaurant restaurant in _restaurants) {
      if (restaurant.id == id) {
        return restaurant;
      }
    }
    return null;
  }

  RestaurantLab();

  RestaurantLab.fromJson(List<dynamic> json) {
    _sRestaurantLab = RestaurantLab();
    for (Map<String, dynamic> restaurantJson in json) {
      addRestaurant(Restaurant.fromJson(restaurantJson));
    }
  }

  List<Restaurant> get restaurants => _restaurants;
  void clearRestaurants() {
    _sRestaurantLab = null;
  }
}