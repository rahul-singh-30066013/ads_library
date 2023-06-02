import 'package:flutter/material.dart';

class DropCap extends StatelessWidget {

  final String text;
  final double size;
  final double? textScaleFactor;

  const DropCap({Key? key, required this.text, required this.size, this.textScaleFactor}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Text(
      text,
      textScaleFactor:
          textScaleFactor ?? MediaQuery.of(context).textScaleFactor,
    );
  }
}

