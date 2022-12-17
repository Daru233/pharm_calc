import 'package:flutter/material.dart';

class ConversionRoot extends StatefulWidget {
  const ConversionRoot({Key? key}) : super(key: key);

  @override
  _ConversionRootState createState() => _ConversionRootState();
}

class _ConversionRootState extends State<ConversionRoot> {

  // take user input and store in ingredient product
  final double SPACED_BOX = 4;

  double active_ingredient = 3;
  double excipients = 750;

  double percentage = 0;
  String ratio = '';
  double active_strength = 0;
  double percentage_for_ratio = 0;

  double active_ingredient_ratio = 0;
  double excipients_ratio = 0;

  String percentage_for_ratio_toString = '';
  String active_ingredient_ratio_toString = '';
  String excipients_ratio_toString = '';

  @override
  Widget build(BuildContext context) {

    // extract to get percentage method
    percentage = (active_ingredient / excipients) * 100;
    percentage = double.parse((percentage).toStringAsFixed(3));

    // extract to get ratio method
    percentage_for_ratio = double.parse((percentage).toStringAsFixed(3));
    active_ingredient_ratio = active_ingredient / active_ingredient;
    excipients_ratio = excipients / active_ingredient;

    active_ingredient_ratio_toString = active_ingredient_ratio.toString();
    excipients_ratio_toString = excipients_ratio.toString();

    ratio = '$active_ingredient_ratio_toString : $excipients_ratio_toString';


    // make active ingredient to 1

    return Container(
      child: Column(
        children: <Widget> [
          LabelValuePair(label:'Active Ingredient (g):', value: active_ingredient),
          SizedBox(height: SPACED_BOX),
          LabelValuePair(label:'Excipients (g):', value: excipients),
          SizedBox(height: SPACED_BOX),
          LabelValuePair(label:'Percentage %:', value: percentage),
          SizedBox(height: SPACED_BOX),
          LabelValuePair(label:'Ratio :', value: ratio),
          SizedBox(height: SPACED_BOX),
          LabelValuePair(label:'A.S :', value: active_strength),
        ],
      )
    );
  }
}

class LabelValuePair extends StatelessWidget {

  final String label;
  final value;

  const LabelValuePair({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  final double LABEL_FONT_SIZE = 18.0;
  final double PRODUCT_FONT_SIZE = 18.0;
  final double SPACED_BOX = 15;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
          children: <Widget>[
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: LABEL_FONT_SIZE,
              ),
            ),
            SizedBox(width: SPACED_BOX), // give it width
            Text(
              value.toString(),
              style: TextStyle(
                color: Colors.amberAccent,
                fontSize: PRODUCT_FONT_SIZE,
              ),
            )
          ],
        )
    );
  }
}
