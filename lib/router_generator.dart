import 'features/shopping_cart.dart'; 
import 'routes.dart';

import 'package:flutter/material.dart';

import 'features/gas_suppliers.dart';
import 'features/home_page.dart';
import 'features/liquor_stores.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homePage:
        return MaterialPageRoute(builder: (_) => HomePage());
      case Routes.liquorStores:
        return MaterialPageRoute(builder: (_) => LiquorStores());
      case Routes.gasSuppliers:
        return MaterialPageRoute(builder: (_) => GasSuppliers());
      case Routes.shoppingCart:
        return MaterialPageRoute(builder: (_) => ShoppingCart()); 
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
