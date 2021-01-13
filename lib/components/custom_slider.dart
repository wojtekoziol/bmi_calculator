import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double _value = 70;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const Alignment(0, 0),
      children: [
        Container(
          height: 20,
          width: 320,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 3),
                  blurRadius: 6,
                  color: Colors.black.withOpacity(0.16),
                )
              ]),
        ),
        SliderTheme(
          data: const SliderThemeData(
            activeTrackColor: Color(0xFFC2F2D4),
            inactiveTrackColor: Color(0xFFC2F2D4),
            trackShape: RoundedRectSliderTrackShape(),
            trackHeight: 20,
            thumbColor: Colors.white,
            thumbShape: RoundSliderThumbShape(
              enabledThumbRadius: 20,
              elevation: 2.5,
            ),
            overlayColor: Colors.transparent,
          ),
          child: Slider(
            min: 1,
            max: 120,
            value: _value,
            onChanged: (value) {
              setState(() {
                _value = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
