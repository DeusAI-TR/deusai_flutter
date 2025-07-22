import 'package:alfai/product/theme/app_colors.dart';
import 'package:flutter/material.dart';
import '../../core/constants/layout_constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool enabled;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final Color activeColor = AppColors.purple600;
    final Color disabledColor = AppColors.gray800;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: activeColor,
        disabledBackgroundColor: disabledColor,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(LayoutConstants.radius8),
        ),
        maximumSize: Size(double.infinity, 56),
        minimumSize: Size(double.infinity, 50),
      ),
      
      onPressed: enabled && !isLoading ? onPressed : null,
      child: isLoading
          ? const CircularProgressIndicator(color: Colors.white)
          : Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
    );
  }
} 