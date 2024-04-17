
//////////////////////////////////// Colors Palette ////////////////////////////////////////////

import 'package:flutter/material.dart';

class colorPalette extends StatefulWidget {
  const colorPalette({super.key});

  @override
  State<colorPalette> createState() => _colorPaletteState();
}

class _colorPaletteState extends State<colorPalette> {
  int _selectedColor = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Select Color',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 8,
        ),
        Wrap(
          children: List<Widget>.generate(
            5,
            (index) => GestureDetector(
              onTap: () {
                setState(() {
                  _selectedColor = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0, bottom: 8.0),
                child: CircleAvatar(
                  backgroundColor: index == 0
                      ? Colors.purple
                      : index == 1
                          ? Colors.pink
                          : index == 2
                              ? Colors.lightBlue
                              : index == 3
                                  ? Colors.green
                                  : Colors.orange,
                  radius: 14,
                  child: _selectedColor == index
                      ? const Icon(
                          Icons.done,
                          size: 16,
                          color: Colors.white,
                        )
                      : null,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
