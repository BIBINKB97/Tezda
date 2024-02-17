
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final double ? size;
  final Color ? clr;
  final double? weight;
  final Function()? onPressed;
  const CustomIconButton({super.key, required this.icon, this.size, this.clr, this.weight, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed, icon: Icon(
        icon, size: size,
        color: clr,
        weight: weight,
    ));
  }
}