import 'package:flutter/material.dart';
import 'package:pharm_calc/conversion/conversion_root.dart';
import 'package:pharm_calc/root_pages/calculations.dart';
import 'package:pharm_calc/root_pages/dilutions.dart';
import 'package:pharm_calc/root_pages/formulations.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
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

  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              Dilutions(),
              Calculations(),
              Formulations(),
            ],
          ),

          Container(
            alignment: Alignment(0, 0.8),
            child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect:  SlideEffect(
                    spacing:  12.0,
                    radius:  4.0,
                    dotWidth:  12.0,
                    dotHeight:  12.0,
                    paintStyle:  PaintingStyle.fill,
                    strokeWidth:  2,
                    dotColor:  Colors.white38,
                    activeDotColor:  Colors.white,
                ),
            ),
          ),
        ],
      )
    );
  }
}
