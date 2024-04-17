import 'package:flutter/material.dart';

class members extends StatelessWidget {
  final String filename;
  const members({
    Key? key,
    required this.filename,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 15,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        backgroundImage: Image.asset('assets/$filename').image,
        radius: 15,
      ),
    );
  }
}