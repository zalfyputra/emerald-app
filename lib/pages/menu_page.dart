import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:emerald/components/button.dart';
import 'package:emerald/components/drink_tile.dart';
import 'package:emerald/pages/drink_details_page.dart';
import 'package:emerald/models/shop.dart';

class MenuPage extends StatefulWidget{
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  void navigateToDrinkDetails(int index){
    final shop = context.read<Shop>();
    final drinkMenu = shop.drinkMenu;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DrinkDetailsPage(
          drink: drinkMenu[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    final shop = context.read<Shop>();
    final drinkMenu = shop.drinkMenu;
    return Scaffold(
      backgroundColor: const Color(0xFF9DC08B),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: const Color(0xFF40513B),
        elevation: 0,
        leading: const Icon(Icons.menu),
        title: const Text("Menu", style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pushNamed(context, '/cart');
            },
            icon: const Icon(Icons.shopping_cart),
          )
        ]
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFEDF1D6),
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Get 20% Promo',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF40513B),
                      ),
                    ),

                    const SizedBox(height: 20),

                    MyButton(
                      text: 'Redeem now',
                      onTap:(){},
                    )
                  ]
                ),
                Image.asset('lib/images/cocktail.png', height: 100,),
              ],
            ),
          ),

          const SizedBox(height: 25),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for your favorite drinks',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          const SizedBox(height: 25),
          
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Beverages',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color:  Color(0xFF40513B),
                fontSize: 18,
              ),
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: drinkMenu.length,
              itemBuilder: (context, index) => DrinkTile(
                drink: drinkMenu[index],
                onTap: () => navigateToDrinkDetails(index),
              ),
            ),
          ),

          const SizedBox(height: 25),

          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Image.asset(
                    'lib/images/cocktail.png',
                    height: 60,
                  ),

                  const SizedBox(width: 20),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cocktail",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF40513B),
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        '\$30.00',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                        ),
                      )
                    ],
                  ),
                ]),

                const Icon(
                  Icons.favorite_outline,
                  color: Colors.grey,
                  size: 28,
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}