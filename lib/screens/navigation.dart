import 'package:bmi_calculator/screens/home_screen.dart';
import 'package:bmi_calculator/screens/weight_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _pageController,
      child: PageView(
        controller: _pageController,
        children: [
          HomeScreen(),
          WeightScreen(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
