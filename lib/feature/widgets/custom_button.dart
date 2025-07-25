import 'package:alfai/product/theme/app_colors.dart';
import 'package:flutter/material.dart';
import '../../core/constants/layout_constants.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final Future<void> Function()? onPressed;
  final bool enabled;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.enabled = true,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  final ValueNotifier<bool> _loading = ValueNotifier(false);

  @override
  void dispose() {
    _loading.dispose();
    super.dispose();
  }

  Future<void> _handleTap() async {
    if (_loading.value || widget.onPressed == null) return;
    _loading.value = true;
    try {
      await widget.onPressed!();
    } finally {
      if (mounted) _loading.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color activeColor = AppColors.purple600;
    final Color disabledColor = AppColors.gray800;
    return ValueListenableBuilder<bool>(
      valueListenable: _loading,
      builder: (context, isLoading, child) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: activeColor,
            disabledBackgroundColor: disabledColor,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(LayoutConstants.radius8),
            ),
            maximumSize: const Size(double.infinity, 56),
            minimumSize: const Size(double.infinity, 50),
          ),
          onPressed: widget.enabled && !isLoading ? _handleTap : null,
          child: isLoading
              ? const SizedBox(height: 24, width: 24, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
              : Text(
                  widget.text,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
        );
      },
    );
  }
} 