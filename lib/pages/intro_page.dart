import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' as google_fonts;
import 'package:emerald/components/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xFF9DC08B),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 50),

            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset("lib/images/intro-image.png"),
            ),

            const SizedBox(height: 5),

            Text(
              "Welcome to Emerald!",
              style: google_fonts.GoogleFonts.poppins(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            Text(
              "Order your favorite beverages and refreshments effortlessly at your fingertips!",
              style: google_fonts.GoogleFonts.poppins(
                fontSize: 15,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 25),

            MyButton(
              text: "Get Started",
              onTap: () {
                Navigator.pushNamed(context, '/menu');
              },
            ),
          ],
        ),
      ),
    );
  }
}