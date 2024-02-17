import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String image;
  const CustomCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
decoration: BoxDecoration(border: Border.all()),
      child: Container(
         height: 100,
         width: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(image)),
          borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}