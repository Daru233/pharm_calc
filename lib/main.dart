import 'package:flutter/material.dart';
import 'package:pharm_calc/conversion/conversion_root.dart';

void main() {
  runApp(MaterialApp(
    home: PharmCalc(),
  ));
}

class PharmCalc extends StatefulWidget {
  const PharmCalc({Key? key}) : super(key: key);

  @override
  State<PharmCalc> createState() => _PharmCalcState();
}

class _PharmCalcState extends State<PharmCalc> {

  double left = 35.0;
  double right = 35.0;
  double top = 40.0;
  double bottom = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Pharm Calc'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(left, top, right, bottom),
        child: Column(
          children: <Widget>[
            ConversionRoot(),
          ],
        ),
      ),
    );
  }
}
