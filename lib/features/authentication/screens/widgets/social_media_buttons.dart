import 'package:flutter/material.dart';

class SocialMediaButtons extends StatelessWidget {
  final String logoPath;
  final VoidCallback onPressed;

  const SocialMediaButtons({
    super.key,
    required this.logoPath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: FittedBox(
        fit: BoxFit.cover,
        child: IconButton(
          onPressed: onPressed,
          icon: Image.asset(logoPath),
          color: Colors.black,
        ),
      ),
    );
  }
}
