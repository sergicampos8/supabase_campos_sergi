// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'dart:math';

class Tile extends StatelessWidget {
  final String title;

  const Tile(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 400,
          width: 400,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.primaries[Random().nextInt(Colors.primaries.length)],
                Colors.primaries[Random().nextInt(Colors.primaries.length)],
              ],
            ),
          ),
        ),
        Text(
          title.toUpperCase(),
          style: Theme.of(context).textTheme.displayMedium,
          textAlign: TextAlign.end,
        )
      ],
    );
  }
}
