
import 'package:flutter/material.dart';
import 'package:foodapp_630710743/componants/button.dart';
import 'package:foodapp_630710743/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: 25,),

            Text(
              "SUSHI MAN",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('lib/images/intro1.png'),
            ),
            const SizedBox(height: 25),
            Text(
              "THE TASTE OF JAPANESE FOOD",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 44,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10,),
            Text(
                "Feel the taste of the most popular Japanese food from anywhere and anytime",
              style: TextStyle(
                color: Colors.grey[300],
                height: 2
              ),
            ),
            const SizedBox(height: 25,),
            
            MyButton(
              text: "Get Started",
              onTap: (){
                Navigator.pushNamed(context, '/menupage');
              },
            ),
        ],),
      ),
    );
  }
}
