import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../product/constants/image_constants.dart';

class CenterLogoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final Color? backgroundColor;
  final Widget? leading;
  final List<Widget>? actions;

  const CenterLogoAppBar({
    super.key,
    this.height = 56,
    this.backgroundColor,
    this.leading,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Theme.of(context).appBarTheme.backgroundColor,
      elevation: 0,
      centerTitle: true,
      leading: leading,
      actions: actions,
      title: SvgPicture.asset(
        ImageConstants.instance.svgAssets.logo,
        height: height * 0.57, // 32/56 oranı
        fit: BoxFit.contain,
      ),
      toolbarHeight: height,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
} 