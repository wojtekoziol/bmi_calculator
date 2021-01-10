import 'package:bmi_calculator/components/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          Padding(
            padding: const EdgeInsets.only(top: 128),
            child: Align(
              child: Column(
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
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Align(
              alignment: Alignment.center,
              child: Image.asset('assets/pngs/bmi.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedButton(
                onPressed: () {},
                height: 60,
                width: 250,
                backgroundColor: const Color(0xFFAE81FF),
                child: Text(
                  'Calculate',
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
