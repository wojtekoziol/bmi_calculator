import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({
    @required this.onChanged,
    @required this.min,
    @required this.max,
    @required this.color,
    @required this.initialValue,
  });

  final void Function(double) onChanged;
  final double min;
  final double max;
  final Color color;
  final double initialValue;

  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

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
          data: SliderThemeData(
            activeTrackColor: widget.color,
            inactiveTrackColor: widget.color,
            trackShape: const RoundedRectSliderTrackShape(),
            trackHeight: 20,
            thumbColor: Colors.white,
            thumbShape: const RoundSliderThumbShape(
              enabledThumbRadius: 20,
              elevation: 2.5,
            ),
            overlayColor: Colors.transparent,
          ),
          child: Slider(
            min: widget.min,
            max: widget.max,
            value: _value,
            onChanged: (value) {
              setState(() {
                widget.onChanged(value);
                _value = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
