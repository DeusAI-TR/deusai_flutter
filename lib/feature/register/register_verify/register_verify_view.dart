import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../core/constants/layout_constants.dart';
import '../../../product/theme/app_text_styles.dart';
import '../../../product/theme/app_colors.dart';
import '../../../product/lang/locale_keys.g.dart';
import '../../widgets/custom_button.dart';
import 'register_verify_view_model.dart';
import 'package:pinput/pinput.dart';
import '../../widgets/center_logo_app_bar.dart';

class RegisterVerifyView extends StatelessWidget {
  const RegisterVerifyView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterVerifyViewModel>.reactive(
      viewModelBuilder: () => RegisterVerifyViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: const LogoAppBar(),
          body: Padding(
            padding: LayoutConstants.padding20All,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  LayoutConstants.emptyHeight24,
                  LayoutConstants.emptyHeight4,
                  Text(
                    LocaleKeys.register_code_title.tr(),
                    textAlign: TextAlign.center,
                    style: AppTextStyles.displayXsSemibold.copyWith(color: AppColors.white),
                  ),
                  LayoutConstants.emptyHeight8,
                  Text(
                    LocaleKeys.register_code_subtitle.tr(namedArgs: {'email': viewModel.email}),
                    textAlign: TextAlign.center,
                    style: AppTextStyles.textSmMedium.copyWith(color: AppColors.gray400),
                  ),
                  LayoutConstants.emptyHeight32,
                  Pinput(
                    length: 4,
                    controller: viewModel.pinputController,
                    focusNode: viewModel.pinputFocusNode,
                    defaultPinTheme: _pinputTheme(borderColor: AppColors.gray400),
                    focusedPinTheme: _pinputTheme(borderColor: AppColors.purple500),
                    separatorBuilder: (index) => const SizedBox(width: 12),
                    onChanged: viewModel.onPinputChanged,
                    onCompleted: viewModel.onPinputCompleted,
                    keyboardType: TextInputType.number,
                    showCursor: true,
                  ),
                  LayoutConstants.emptyHeight24,
                  CustomButton(
                    text: LocaleKeys.register_code_button.tr(),
                    onPressed: () async => viewModel.navigateToRegister(),
                    enabled: viewModel.isCodeValid,
                  ),
                  LayoutConstants.emptyHeight16,
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          LocaleKeys.register_code_not_received.tr(),
                          style: AppTextStyles.textSmRegular.copyWith(color: AppColors.gray400),
                        ),
                        LayoutConstants.emptyWidth8,
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            LocaleKeys.register_code_resend.tr(),
                            style: AppTextStyles.textSmBold.copyWith(color: AppColors.purple500),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  PinTheme _pinputTheme({Color? borderColor}) {
    return PinTheme(
      width: 75,
      height: 44,
      textStyle: AppTextStyles.textXlBold.copyWith(color: AppColors.white),
      decoration: BoxDecoration(
        color: AppColors.gray800,
        borderRadius: BorderRadius.circular(LayoutConstants.radius8),
        border: Border.all(color: borderColor ?? AppColors.purple500, width: 1.5),
      ),
    );
  }
}
