import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../product/constants/image_constants.dart';

class GoogleButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const GoogleButton({super.key, required this.onPressed, this.text = 'Google ile giriş yap'});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: const Color(0xFF23232B), // Koyu gri
          side: const BorderSide(color: Colors.white, width: 1),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              ImageConstants.instance.iconAssets.google,
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 12),
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
} 