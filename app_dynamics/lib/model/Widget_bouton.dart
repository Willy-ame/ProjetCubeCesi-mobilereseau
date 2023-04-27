import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final IconData monicon;

  CustomButton({
    required this.text,
    required this.onPressed,
    required this.monicon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: EdgeInsets.all(10),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(
          monicon,
          color: Color.fromARGB(255, 255, 255, 255),
          size: 35,
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(140, 255, 106, 0),
            minimumSize: Size(100, 80),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3)) // taille du bouton
            ),
        label: Text(
          text,
          style: GoogleFonts.tomorrow(
              textStyle: TextStyle(fontSize: 20, color: Colors.black)),
        ),
      ),
    ));
  }
}
