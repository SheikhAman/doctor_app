import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final double height, width;
  final IconData icon;
  final Color iconColor;
  final void Function()? ontap;

  const CustomIconButton({
    required this.ontap,
    required this.height,
    required this.width,
    required this.icon,
    this.iconColor = Colors.grey,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: SizedBox(
        height: height,
        width: width,
        child: Card(
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
