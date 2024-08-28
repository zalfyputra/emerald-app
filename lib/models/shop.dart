import 'package:flutter/material.dart';
import 'drink.dart';

class Shop extends ChangeNotifier{
  final List<Drink> _drinkmenu = [
    Drink(
      name: "Rosé Spritz",
      price: "20.00",
      imagePath: "lib/images/rose-spritz.png",
      rating: "4.5",
    ),

    Drink(
      name: "Midori Green",
      price: "25.00",
      imagePath: "lib/images/midori.png",
      rating: "4.0",
    )
  ];

  List <Drink> _cart = [];
  List <Drink> get drinkMenu => _drinkmenu;
  List <Drink> get cart => _cart;

  void addToCart(Drink drinkItem, int quantity){
    for(int i = 0; i < quantity; i++){
      _cart.add(drinkItem);
    }
  }

  void removeFromCart(Drink drink){
    _cart.remove(drink);
    notifyListeners();
  }
}