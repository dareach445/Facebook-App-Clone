import 'package:flutter/material.dart';

class TypeMarketplace extends StatelessWidget {
  const TypeMarketplace({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(children: [
        const Text("Sell",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 20),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),  // Increased padding
            decoration: BoxDecoration(
              color: Colors.blue[100], //background Color
              borderRadius: BorderRadius.circular(20),
               boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 15,
                  offset: Offset(0, 3), // Shadow position
                ),
              ],  //Round Corners
            ), 
              child:  const Text(
                "For you",
                style: TextStyle(
                  fontSize: 20, 
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,  //Text Color
                ),
              ),
          ),

        const SizedBox(width: 20),
        const Text("Categories",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ]),
    );
  }
}