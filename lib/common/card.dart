import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Card extends StatefulWidget {
  const Card({super.key, required Container child, required BuildContext context});

  @override
  State<Card> createState() => _CardState();
}

class _CardState extends State<Card> {
  @override
  Widget build(BuildContext context) {
    return Card(
        context: context,
        child: Container(
      child: Column(
        children: [
          Text('カード'),
        ],
      ),
    ));
  }
}
