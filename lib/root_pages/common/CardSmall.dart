import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharm_calc/redux/app_state.dart';

import '../../redux/reduxActions.dart';

class CardSmall extends StatefulWidget {
  final String title;
  final String subtitle;
  final Color rgbValue;

  const CardSmall({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.rgbValue,
  }) : super(key: key);

  @override
  _CardSmallState createState() => _CardSmallState();
}

class _CardSmallState extends State<CardSmall> {

  TextEditingController ValueController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color:Color.fromRGBO(203, 190, 215, 1),
      ),
      height: 70,
      width: 160,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          StoreConnector<AppState, double>(
            converter: (store) => store.state.conversionValue,
            builder: (context, double conversionValue) {
              return TextField(
                controller: ValueController..text='${conversionValue.toInt()}',
                onChanged: (v) => {
                  ValueController.text = v,
                  ValueController.selection =
                      TextSelection.collapsed(offset: ValueController.text.length),
                },
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 6),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              );
            },
          ),
          returnSubtitle()
        ],
      ),
    );
  }

  Container returnSubtitle() {
    return Container(
          child: Text(
              widget.subtitle,
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: Color.fromRGBO(7, 20, 39, 1)
                  ),
                  fontSize: 12,
                  fontWeight: FontWeight.bold
              )
          ),
        );
  }
}
