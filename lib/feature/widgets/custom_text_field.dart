import 'package:flutter/material.dart';
import '../../core/constants/layout_constants.dart';
import '../../product/theme/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  final bool isPassword;
  final TextInputType keyboardType;
  final Color? borderColor;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.labelText,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.borderColor,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    final Color enabledColor = widget.borderColor ?? AppColors.gray700;
    final Color focusedColor = widget.borderColor ?? AppColors.purple500;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null) ...[
          Text(
            widget.labelText!,
            style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.white, fontSize: 14),
          ),
          LayoutConstants.emptyHeight6,
        ],
        TextField(
          controller: widget.controller,
          obscureText: widget.isPassword ? _obscure : false,
          keyboardType: widget.keyboardType,
          
          decoration: InputDecoration(
            hintText: widget.hintText,
            
            contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(LayoutConstants.radius8),
              borderSide: BorderSide(color: enabledColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(LayoutConstants.radius8),
              borderSide: BorderSide(color: enabledColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(LayoutConstants.radius8),
              borderSide: BorderSide(color: focusedColor, width: 1),
            ),
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _obscure ? Icons.visibility_off : Icons.visibility,
                      color: AppColors.gray400,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscure = !_obscure;
                      });
                    },
                  )
                : null,
            hintStyle: const TextStyle(color: Colors.white70),
            filled: true,
            fillColor: AppColors.gray900,
          ),
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
} 