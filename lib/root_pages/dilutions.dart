import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Dilutions extends StatelessWidget {
  const Dilutions ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(24, 40, 67, 1),
      padding: EdgeInsets.all(25),
        child: SafeArea(
          child: Column(
            children: [
              DilutionsTextBuilder(),
              ConversionDisplay(),
              // results output
              Container(
                // color: Colors.white,
                padding: EdgeInsets.only(top: 8),
                height: 400,
                width: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ResultsContainerMG(),
                    SizedBox(height: 24),
                    ResultsContainerMicrograms(),
                    SizedBox(height: 24),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }

  Container ResultsContainerMG() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color.fromRGBO(36, 52, 78, 1),
      ),
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '0.3',
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: Colors.white),
                fontSize: 32,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(width: 12),
          Text(
            'g',
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: Colors.white),
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }

  Container ResultsContainerMicrograms() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color.fromRGBO(36, 52, 78, 1),
      ),
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
              '300000',
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: Colors.white),
                  fontSize: 32,
                  fontWeight: FontWeight.bold
              ),
          ),
          SizedBox(width: 12),
          Text(
            'µg',
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: Colors.white),
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }

  Container ConversionDisplay() {
    return Container(
      // color: Colors.white,
      height: 180,
      padding: EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Display(),
          SizedBox(width: 20),
          Input()
        ],
      ),
    );
  }

  Column Display() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Color.fromRGBO(199, 233, 167, 1),
          ),
          height: 160,
          width: 160,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '300 mg',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: Color.fromRGBO(7, 20, 39, 1)),
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                  )
                )
            ],
          ),
        )
      ],
    );
  }
}

  Column Input() {
    return Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                // color: Colors.greenAccent,
              ),
              height: 160,
              width: 160,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InputValueContainer(),
                SizedBox(height: 20),
                InputMeasurementContainer()
                ],
              ),
            )
          ],
        );
  }

  Container InputValueContainer() {
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
          Text(
              '300',
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: Color.fromRGBO(7, 20, 39, 1)
                  ),
                  fontSize: 32,
                  fontWeight: FontWeight.bold
              )
          ),
          Text(
            'value',
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: Color.fromRGBO(7, 20, 39, 1)
                  ),
                  fontSize: 12,
                  fontWeight: FontWeight.bold
              )
          )
        ],
      ),
    );
  }

Container InputMeasurementContainer() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: Color.fromRGBO(36, 52, 78, 1),
    ),
    height: 70,
    width: 160,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
            'mg',
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: Colors.white),
                fontSize: 32,
                fontWeight: FontWeight.bold
            )
        ),
        Text(
            'measurement',
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: Colors.white),
                fontSize: 12,
                fontWeight: FontWeight.bold
            )
        )
      ],
    ),
  );
}


Text DilutionsTextBuilder() {
    return Text(
      'Conversions',
      style: GoogleFonts.lato(
        textStyle: TextStyle(
          color: Colors.white,
          fontSize: 28,
          fontWeight: FontWeight.bold
        )
      ),
    );
  }
