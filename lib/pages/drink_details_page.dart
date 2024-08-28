import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:emerald/components/button.dart';
import 'package:emerald/models/drink.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:emerald/models/shop.dart';

class DrinkDetailsPage extends StatefulWidget {
  final Drink drink;
  const DrinkDetailsPage({
    super.key,
    required this.drink,
  });

  @override
  State<DrinkDetailsPage> createState() => _DrinkDetailsPageState();
}

class _DrinkDetailsPageState extends State<DrinkDetailsPage> {
  int quantityCount = 0;

  void decrementQuantity(){
    setState(() {
      if(quantityCount > 0){
        quantityCount--;
      }
    });
  }

  void incrementQuantity(){
    setState((){
      setState((){
        quantityCount++;
      });
    });
  }

  void addToCart(){
    if (quantityCount > 0){
      final shop = context.read<Shop>();
      shop.addToCart(widget.drink, quantityCount);
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.grey[100],
          content: Text(
            "Successfully added to cart",
            style: TextStyle(color: Colors.grey[800]),
            textAlign: TextAlign.center,
          ),
          actions: [
            IconButton(
              onPressed: (){
                Navigator.pop(context);
                Navigator.pop(context);
              },
              icon: const Icon(Icons.done),
            )
          ]
        )
      );
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xFFEDF1D6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFEDF1D6),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView(
                children: [
                  Image.asset(
                    widget.drink.imagePath,
                    height: 150,
                  ),

                  const SizedBox(height: 25),

                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                      ),

                      const SizedBox(width: 5),

                      Text(
                        widget.drink.rating,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                        )
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  Text(
                    widget.drink.name,
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Text(
                    "Description",
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    'The Rosé Spritz is a refreshing and elegant cocktail that perfectly balances the fruity notes of rosé wine with the effervescence of sparkling water. This delightful drink is typically garnished with a slice of citrus or a handful of fresh berries, adding a burst of color and flavor.',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                      height: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Container(
            color: const Color(0xFF40513B),
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${widget.drink.price}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),

                    Row(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFF9DC08B),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.remove,
                              color: Color(0xFF40513B),
                            ),
                            onPressed: decrementQuantity,
                          ),
                        ),

                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              quantityCount.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              )
                            ),
                          ),
                        ),

                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFF9DC08B),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.add,
                              color: Color(0xFF40513B),
                            ),
                            onPressed: incrementQuantity,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                MyButton(text: 'Add to cart', onTap: addToCart),
              ],
            ),
          ),
        ],
      ),
    );
  }
}