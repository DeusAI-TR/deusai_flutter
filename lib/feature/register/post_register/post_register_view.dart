import 'package:alfai/feature/widgets/center_logo_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../core/constants/layout_constants.dart';
import '../../../product/theme/app_text_styles.dart';
import '../../../product/theme/app_colors.dart';
import '../../../product/constants/image_constants.dart';
import '../../../product/lang/locale_keys.g.dart';
import '../../widgets/custom_button.dart';

enum PostRegisterState { success, error }

class PostRegisterView extends StatelessWidget {
  final PostRegisterState state;
  const PostRegisterView({super.key, this.state = PostRegisterState.success});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LogoAppBar(),
      body: Padding(
        padding: LayoutConstants.padding20All,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LayoutConstants.emptyHeight24,
            LayoutConstants.emptyHeight4,
            Icon(
              state == PostRegisterState.success ? Icons.check_circle : Icons.cancel,
              color: state == PostRegisterState.success ? AppColors.purple500 : AppColors.red500,
              size: 72,
            ),
            LayoutConstants.emptyHeight32,
            Text(
              state == PostRegisterState.success
                  ? LocaleKeys.register_success_title.tr()
                  : LocaleKeys.register_error_title.tr(),
              textAlign: TextAlign.center,
              style: AppTextStyles.textXlBold.copyWith(color: AppColors.white),
            ),
            LayoutConstants.emptyHeight8,
            Text(
              state == PostRegisterState.success
                  ? LocaleKeys.register_success_subtitle.tr()
                  : LocaleKeys.register_error_subtitle.tr(),
              textAlign: TextAlign.center,
              style: AppTextStyles.textMdRegular.copyWith(color: AppColors.gray400),
            ),
            LayoutConstants.emptyHeight32,
            CustomButton(
              text:
                  state == PostRegisterState.success
                      ? LocaleKeys.register_success_button.tr()
                      : LocaleKeys.register_error_button.tr(),
              onPressed: () async {},
            ),
          ],
        ),
      ),
    );
  }
}
