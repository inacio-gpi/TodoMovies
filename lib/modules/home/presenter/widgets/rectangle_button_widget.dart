import 'package:flutter/material.dart';

class RectangleButtonWidget extends StatelessWidget {
  final Color? backgroundColor;
  final void Function()? onPressed;
  final Widget child;
  const RectangleButtonWidget({
    Key? key,
    this.backgroundColor,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: Colors.black,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
