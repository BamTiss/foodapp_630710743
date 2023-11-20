
import 'package:flutter/material.dart';
import 'package:foodapp_630710743/componants/button.dart';
import 'package:foodapp_630710743/models/foods.dart';
import 'package:foodapp_630710743/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../componants/food_tile.dart';
import '../models/shop.dart';
import 'food_details_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  void navigateToFoodDetails(int index){
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailsPage(
        food: foodMenu[index],
      ),
     ),
    );
  }
  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[800],
        elevation: 0,
        leading: const Icon(
            Icons.menu,
        ),
        title: const Text(
          'Tokyo',
        ),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pushNamed(context, '/cartpage');
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Column(
        children: [
        Container(
          decoration: BoxDecoration(color: primaryColor,borderRadius: BorderRadius.circular(20)),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Get 32% Promo',
                    style: GoogleFonts.dmSerifDisplay(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 20,),

                  MyButton(text: 'Redeem',
                      onTap: (){}
                  )
                ],
              ),
              Image.asset(
                'lib/images/sushi.png',
                height: 100,
              ),
            ],
          ),
        ),
          const SizedBox(height: 25,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius:BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius:BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius:BorderRadius.circular(20),
                  ),hintText: "Search here..",
              ),
            ),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
                "Food Menu",
              style: TextStyle(
                  fontWeight: FontWeight.bold,color: Colors.grey[800]),
            ),
          ),
          const SizedBox(height: 10),

          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: foodMenu.length,
                itemBuilder: (context, index) => FoodTile(
                  food: foodMenu[index],
                  onTap: () => navigateToFoodDetails(index),
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.only(left: 25,right: 25,bottom: 25),
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(

                  children: [
                    Image.asset(
                      'lib/images/sushi (1).png',
                      height: 60,
                    ),
                    const SizedBox(width: 20),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Salmon Eggs",
                          style: GoogleFonts.dmSerifDisplay(fontSize: 18,),
                        ),
                        const SizedBox(height: 10),

                        Text('\$21.00',style: TextStyle(color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  ],
                ),
                const Icon(
                  Icons.favorite_outline,
                  color: Colors.grey,
                  size: 29,
                ),
            ],),
          )
       ],
      ),
    );
  }
}
