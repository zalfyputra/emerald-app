import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:emerald/models/shop.dart';
import 'package:emerald/models/drink.dart';
import 'package:emerald/components/button.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeFromCart(Drink drink, BuildContext context){
    final shop = context.read<Shop>();
    shop.removeFromCart(drink);
  }

  @override
  Widget build(BuildContext context){
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold (
        appBar: AppBar(
          title: const Text('My cart'),
          elevation: 0,
          backgroundColor: const Color(0xFF609966),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index){
                  final Drink drink = value.cart[index];
                  final String drinkName = drink.name;
                  final String drinkPrice = drink.price;
              
                  return Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDF1D6),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
                    child: ListTile(
                      title: Text(drinkName),
                      subtitle: Text('\$$drinkPrice'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => removeFromCart(drink, context),
                      ),
                    ),
                  );
                }
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(25),
              child: MyButton(
                  text: 'Pay now',
                  onTap: (){},
              ),
            )
          ]
        )
      )
    );
  }
}