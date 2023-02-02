import 'package:flutter/material.dart';

class ButtonFiltre extends StatelessWidget {
  const ButtonFiltre({
    super.key,
    required this.title,
    required this.bgred,
    required this.bgvert,
    required this.bgbleu,
    required this.fgred,
    required this.fgvert,
    required this.fgbleu,

  });

  final String title;
  final int bgred;
  final int bgvert;
  final int bgbleu;
  final int fgred;
  final int fgvert;
  final int fgbleu;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromRGBO(bgred, bgvert, bgbleu, 1),
        foregroundColor: Color.fromRGBO(fgred, fgvert, fgbleu, 1),
        shape: const StadiumBorder(),
      ),
      child: Text(title),
    );
  }
}
