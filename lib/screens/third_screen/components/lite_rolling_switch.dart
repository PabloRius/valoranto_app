library lite_rolling_switch;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:valoranto/screens/third_screen/components/poligono.dart';

import '../../../constants.dart';


/// Customable and nice Switch button :).
///
/// Currently, you can change the widget
/// width but not the height property.
///
/// The following arguments are required:
///
/// * [value] determines switch state (on/off).
/// * [onChanged] is called when user toggles switch on/off.
/// * [onTap] event called on tap
/// * [onDoubleTap] event called on double tap
/// * [onSwipe] event called on swipe (left/right)
///
class LiteRollingSwitch extends StatefulWidget {
  @required
  final bool value;
  final double width;

  @required
  final double height;
  final Function(bool) onChanged;
  final String textOff;
  final Color textOffColor;
  final String textOn;
  final Color textOnColor;
  final Color colorOn;
  final Color colorOff;
  final double textSize;
  final Duration animationDuration;
  final IconData iconOn;
  final IconData iconOff;
  final Function onTap;
  final Function onDoubleTap;
  final Function onSwipe;

  const LiteRollingSwitch({super.key,
    this.height = 100,
    this.value = false,
    this.width = 130,
    this.textOff = "Off",
    this.textOn = "On",
    this.textSize = 14.0,
    this.colorOn = Colors.green,
    this.colorOff = Colors.red,
    this.iconOff = Icons.flag,
    this.iconOn = Icons.check,
    this.animationDuration = const Duration(milliseconds: 600),
    this.textOffColor = Colors.white,
    this.textOnColor = Colors.black,
    required this.onTap,
    required this.onDoubleTap,
    required this.onSwipe,
    required this.onChanged,
  });

  @override
  _RollingSwitchState createState() => _RollingSwitchState();
}

class _RollingSwitchState extends State<LiteRollingSwitch>
    with SingleTickerProviderStateMixin {
  /// Late declarations
  late AnimationController animationController;
  late Animation<double> animation;
  late bool turnState;

  double value = 0.0;

  @override
  void dispose() {
    //Ensure to dispose animation controller
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this,
        lowerBound: 0.0,
        upperBound: 1.0,
        duration: widget.animationDuration);
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    animationController.addListener(() {
      setState(() {
        value = animation.value;
      });
    });
    turnState = widget.value;

    // Executes a function only one time after the layout is completed.
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      setState(() {
        if (turnState) {
          animationController.forward();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //Color transition animation
    Color? transitionColor = Color.lerp(widget.colorOff, widget.colorOn, value);

    return GestureDetector(
      onDoubleTap: () {
        _action();
        widget.onDoubleTap();
      },
      onTap: () {
        _action();
        widget.onTap();
      },
      onPanEnd: (details) {
        _action();
        widget.onSwipe();
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
            color: transitionColor, borderRadius: BorderRadius.zero),
        child: Stack(
          children: <Widget>[
            Transform.translate(
              offset: isRTL(context)
                  ? Offset(-10 * value, 0)
                  : Offset(10 * value, 0), //original
              child: Opacity(
                opacity: (1 - value).clamp(0.0, 1.0),
                child: Align(
                  alignment: const Alignment(0.2, 0),
                  child: SizedBox(
                    height: widget.height,
                    child: Text(
                      widget.textOff,
                      style: tungstenBoldFont(kPaper, 80),
                    ),
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: isRTL(context)
                  ? Offset(-10 * (1 - value), 0)
                  : Offset(10 * (1 - value), 0), //original
              child: Opacity(
                opacity: value.clamp(0.0, 1.0),
                child: Align(
                  alignment: const Alignment(-0.2, 0),
                  child: SizedBox(
                    height: widget.height,
                    child: Text(
                      widget.textOn,
                      style: tungstenBoldFont(const Color(0xffECE8E1), 80),
                    ),
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: isRTL(context)
                  ? Offset((-widget.width + 50) * value, 0)
                  : Offset((widget.width - 123) * value, 0),
              child: Transform.rotate(
                angle: 0,
                child: Container(
                  height: widget.height,
                  width: 123,
                  alignment: Alignment.center,
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: Opacity(
                          opacity: (1 - value).clamp(0.0, 1.0),
                          child: Stack(
                            children: [
                              ClipPath(
                                clipper: Triangle2(),
                                child: Container(
                                  color: Colors.black,
                                ),
                              ),
                              Align(
                                alignment: const Alignment(-0.8,0),
                                child: RotationTransition(
                                    turns: const AlwaysStoppedAnimation( 60 / 360),
                                    child: Image.asset(
                                      "assets/icons/Knife_icon.png",
                                      height: 30,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: Opacity(
                          opacity: value.clamp(0.0, 1.0),
                          child: Stack(
                            children: [
                              ClipPath(
                                clipper: Triangle1(),
                                child: Container(
                                  color: kRedMain,
                                ),
                              ),
                              Align(
                                alignment: const Alignment(0.5, 0),
                                  child: Image.asset(
                                    "assets/icons/Heavy_Shields.png",
                                    height: 60,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _action() {
    _determine(changeState: true);
  }

  _determine({bool changeState = false}) {
    setState(() {
      if (changeState) turnState = !turnState;
      (turnState)
          ? animationController.forward()
          : animationController.reverse();

      widget.onChanged(turnState);
    });
  }
}

bool isRTL(BuildContext context) {
  return Bidi.isRtlLanguage(Localizations.localeOf(context).languageCode);
}
