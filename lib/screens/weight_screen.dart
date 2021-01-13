import 'package:bmi_calculator/components/animated_button.dart';
import 'package:bmi_calculator/components/custom_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class WeightScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pageController = Provider.of<PageController>(context, listen: false);

    return Scaffold(
      backgroundColor: const Color(0xFF84E5A9),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: SvgPicture.asset('assets/svgs/green-1.svg'),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset('assets/svgs/green-2.svg'),
          ),
          Align(
            child: Padding(
              padding: const EdgeInsets.only(top: 200, bottom: 125),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/pngs/person-1.png'),
                  Column(
                    children: [
                      Text(
                        'Weight (kg)',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
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
                        '71',
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
                    ],
                  ),
                  CustomSlider(),
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
                      onPressed: () {
                        pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      height: 40,
                      backgroundColor: const Color(0xFFC2F2D4),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Image.asset('assets/pngs/left-arrow.png'),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 3,
                    child: AnimatedButton(
                      onPressed: () {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      height: 40,
                      backgroundColor: Colors.white,
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: const Color(0xFF84E5A9),
                          fontSize: 24,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.bold,
                          shadows: [
                            BoxShadow(
                              offset: const Offset(0, 3),
                              blurRadius: 6,
                              color: const Color(0xFF84E5A9).withOpacity(0.16),
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
