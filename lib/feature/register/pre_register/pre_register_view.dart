import 'package:alfai/feature/widgets/center_logo_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../core/constants/layout_constants.dart';
import '../../../product/theme/app_text_styles.dart';
import '../../../product/theme/app_colors.dart';
import '../../../product/lang/locale_keys.g.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/google_button.dart';
import '../../widgets/form_divider.dart';
import 'pre_register_view_model.dart';

class PreRegisterView extends StatelessWidget {
  const PreRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PreRegisterViewModel>.reactive(
      viewModelBuilder: () => PreRegisterViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: const LogoAppBar(),
          body: Padding(
            padding: LayoutConstants.padding20All,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  LayoutConstants.emptyHeight24,
                  LayoutConstants.emptyHeight4,
                  Text(
                    LocaleKeys.register_title.tr(),
                    textAlign: TextAlign.center,
                    style: AppTextStyles.displayXsSemibold.copyWith(color: AppColors.white),
                  ),
                  LayoutConstants.emptyHeight8,
                  Text(
                    LocaleKeys.register_subtitle.tr(),
                    textAlign: TextAlign.center,
                    style: AppTextStyles.textMdRegular.copyWith(color: AppColors.gray400),
                  ),
                  LayoutConstants.emptyHeight32,
                  CustomTextField(
                    controller: viewModel.emailController,
                    hintText: LocaleKeys.register_email_hint.tr(),
                    labelText: LocaleKeys.register_email_label.tr(),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  LayoutConstants.emptyHeight24,
                  CustomButton(
                    text: LocaleKeys.register_send_code.tr(),
                    onPressed: () async => viewModel.navigateToRegisterVerify(),
                    enabled: viewModel.isEmailNotEmpty,
                  ),
                  LayoutConstants.emptyHeight16,
                  const FormDivider(),
                  LayoutConstants.emptyHeight16,
                  GoogleButton(
                    onPressed: () {},
                    text: LocaleKeys.register_with_google.tr(),
                  ),
                  LayoutConstants.emptyHeight16,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        LocaleKeys.register_already_account.tr(),
                        style: AppTextStyles.textSmRegular.copyWith(color: AppColors.gray400),
                      ),
                      GestureDetector(
                        onTap: viewModel.navigateToLogin,
                        child: Text(
                          LocaleKeys.register_login.tr(),
                          style: AppTextStyles.textSmBold.copyWith(color: AppColors.purple500),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
} 