import 'package:flutter/material.dart';

class Dilutions extends StatelessWidget {
  const Dilutions ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
        child: ListView(
          children: [
            genericRow(),
            genericRow(),
            genericRow(),
            genericRow(),
            genericRow(),
            genericRow(),
          ],
        )
    );
  }

  Row genericRow() {
    return Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: EdgeInsets.fromLTRB(25, 20, 25, 20),
                height: 180,
                width: 340,
              )
            ],
          );
  }
}
