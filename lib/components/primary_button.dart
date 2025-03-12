import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Widget child;
  final void Function()? onPressed;
  final Color? color;
  final double? width;
  final double? height;

  const PrimaryButton(
      {super.key,
      required this.child,
      required this.onPressed,
      required this.color,
      this.width,
      this.height});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height ?? 45.0,
        // padding: const EdgeInsets.symmetric(vertical: 10),
        width: width ?? MediaQuery.of(context).size.width,
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
        child: Center(child: child),
      ),
    );
  }
}
