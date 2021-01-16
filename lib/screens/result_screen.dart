import 'package:bmi_calculator/components/animated_button.dart';
import 'package:bmi_calculator/models/bmi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

class ResultScreen extends StatelessWidget {
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
          TweenAnimationBuilder(
            tween: Tween<double>(
              begin: 0.3,
              end: 0,
            ),
            duration: const Duration(milliseconds: 1500),
            curve: Curves.fastOutSlowIn,
            builder: (context, double value, child) {
              return Align(
                alignment: Alignment.bottomCenter.add(Alignment(0, value)),
                child: child,
              );
            },
            child: SvgPicture.asset('assets/svgs/clouds-blue.svg'),
          ),
          TweenAnimationBuilder(
            tween: Tween<double>(
              begin: 0.5,
              end: 0,
            ),
            duration: const Duration(milliseconds: 1500),
            curve: Curves.fastOutSlowIn,
            builder: (context, double value, child) {
              return Align(
                alignment: Alignment.bottomCenter.add(Alignment(0, value)),
                child: child,
              );
            },
            child: SvgPicture.asset('assets/svgs/clouds-white.svg'),
          ),
          TweenAnimationBuilder(
            tween: Tween<double>(begin: -0.1, end: 0),
            duration: const Duration(milliseconds: 1500),
            builder: (context, double value, child) {
              return Align(
                alignment: Alignment(0, -0.8 + value),
                child: child,
              );
            },
            child: Text(
              bmiResult.toStringAsFixed(1),
              style: TextStyle(
                color: Colors.white,
                fontSize: 86,
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
          ),
          Align(
            alignment: const Alignment(0, -0.55),
            child: Text(
              results[1].toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                shadows: [
                  BoxShadow(
                    offset: const Offset(0, 3),
                    blurRadius: 6,
                    color: Colors.black.withOpacity(0.16),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  results[0],
                  style: TextStyle(
                    fontSize: 18,
                    shadows: [
                      BoxShadow(
                        offset: const Offset(0, 3),
                        blurRadius: 6,
                        color: Colors.black.withOpacity(0.16),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 30),
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
                            border: Border.all(color: const Color(0xFFEAEAEA)),
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
                            border: Border.all(color: const Color(0xFFEAEAEA)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  results[2],
                  style: TextStyle(
                    fontSize: 18,
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
          Align(
            alignment: const Alignment(0, 0.9),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                children: [
                  Expanded(
                    child: AnimatedButton(
                      onPressed: () {
                        Share.share(
                          'Just measured my BMI via BMI Calculator (https://github.com/wojtekoziol/bmi_calculator) and it\'s ${bmiResult.toStringAsFixed(1)}!',
                          subject: 'My BMI Result',
                        );
                      },
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
                          curve: Curves.fastOutSlowIn,
                        );
                      },
                      height: 40,
                      backgroundColor: Colors.white,
                      child: Text(
                        'Go back',
                        style: TextStyle(
                          color: const Color(0xFF21C3FF),
                          fontSize: 24,
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
