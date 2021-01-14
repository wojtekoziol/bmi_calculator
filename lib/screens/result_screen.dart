import 'package:bmi_calculator/components/animated_button.dart';
import 'package:bmi_calculator/models/bmi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ResultScreen extends StatefulWidget {
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    final bmi = Provider.of<Bmi>(context, listen: false);
    final pageController = Provider.of<PageController>(context, listen: false);
    final bmiResult = bmi.getResult();
    final results = bmi.getResults(bmiResult);
    final borders = bmi.getBorders(bmiResult);
    final percentIndicatorHeight =
        1.8 * ((bmiResult - borders[0]) * 100) / (borders[1] - borders[0]);

    return Scaffold(
      backgroundColor: const Color(0xFF21C3FF),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SvgPicture.asset('assets/svgs/clouds-blue.svg'),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SvgPicture.asset('assets/svgs/clouds-white.svg'),
          ),
          Align(
            child: Padding(
              padding: const EdgeInsets.only(top: 75, bottom: 140),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        bmiResult.toStringAsFixed(1),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 86,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.bold,
                          shadows: [
                            BoxShadow(
                              offset: const Offset(0, 3),
                              blurRadius: 6,
                              color: Colors.black.withOpacity(0.16),
                            )
                          ],
                        ),
                      ),
                      Text(
                        results[1].toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Nunito',
                          shadows: [
                            BoxShadow(
                              offset: const Offset(0, 3),
                              blurRadius: 6,
                              color: Colors.black.withOpacity(0.16),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 100),
                  Text(
                    results[0],
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Nunito',
                      shadows: [
                        BoxShadow(
                          offset: const Offset(0, 3),
                          blurRadius: 6,
                          color: Colors.black.withOpacity(0.16),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 180,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: 180,
                            width: 90,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(32),
                              border:
                                  Border.all(color: const Color(0xFFEAEAEA)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.16),
                                  offset: const Offset(0, 3),
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: percentIndicatorHeight < 50
                                ? 50
                                : percentIndicatorHeight,
                            width: 90,
                            decoration: BoxDecoration(
                              color: const Color(0xFF21C3FF),
                              borderRadius: BorderRadius.circular(32),
                              border:
                                  Border.all(color: const Color(0xFFEAEAEA)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    results[2],
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Nunito',
                      shadows: [
                        BoxShadow(
                          offset: const Offset(0, 3),
                          blurRadius: 6,
                          color: Colors.black.withOpacity(0.16),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.9),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                children: [
                  Expanded(
                    child: AnimatedButton(
                      onPressed: () {},
                      height: 40,
                      backgroundColor: const Color(0xFF21C3FF),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Image.asset('assets/pngs/share.png'),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 3,
                    child: AnimatedButton(
                      onPressed: () {
                        pageController.animateToPage(
                          0,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      height: 40,
                      backgroundColor: Colors.white,
                      child: Text(
                        'Go back',
                        style: TextStyle(
                          color: const Color(0xFF21C3FF),
                          fontSize: 24,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.bold,
                          shadows: [
                            BoxShadow(
                              offset: const Offset(0, 3),
                              blurRadius: 6,
                              color: const Color(0xFF21C3FF).withOpacity(0.16),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
