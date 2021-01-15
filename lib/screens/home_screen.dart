import 'package:bmi_calculator/components/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pageController = Provider.of<PageController>(context, listen: false);

    return Scaffold(
      backgroundColor: const Color(0xFFBF9DFF),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset('assets/svgs/purple-1.svg'),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: SvgPicture.asset('assets/svgs/purple-2.svg'),
          ),
          Align(
            child: Padding(
              padding: const EdgeInsets.only(top: 125, bottom: 300),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'BMI Calculator',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 48,
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
                        'Be aware of yourself!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
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
                  Image.asset('assets/pngs/bmi.png'),
                ],
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.9),
            child: AnimatedButton(
              onPressed: () {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              height: 60,
              width: 250,
              backgroundColor: const Color(0xFFAE81FF),
              child: Text(
                'Calculate',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
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
            ),
          ),
        ],
      ),
    );
  }
}
