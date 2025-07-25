import 'package:alfai/feature/widgets/center_logo_app_bar.dart';
import 'package:alfai/product/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'home_view_model.dart';
import '../../product/theme/app_text_styles.dart';
import '../../product/theme/app_colors.dart';
import '../../core/constants/layout_constants.dart';
import '../widgets/custom_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: LogoAppBar(centerTitle: false, actions: [_UpgradeButton()]),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: LayoutConstants.padding20All,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _content(viewModel),
                        LayoutConstants.emptyHeight16,
                        // Boyut seçimi
                        Text('Boyut', style: AppTextStyles.textSmRegular.copyWith(color: AppColors.white)),
                        LayoutConstants.emptyHeight8,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: VideoSize.values.map((e) => _SizeButton(size: e, viewModel: viewModel)).toList(),
                        ),
                        LayoutConstants.emptyHeight20,
                        // Stil seçimi
                        // Text('Stil', style: AppTextStyles.textSmRegular.copyWith(color: AppColors.white)),
                        // LayoutConstants.emptyHeight8,
                        // SizedBox(
                        //   height: 90,
                        //   child: ListView.separated(
                        //     scrollDirection: Axis.horizontal,
                        //     itemCount: 4,
                        //     separatorBuilder: (_, __) => const SizedBox(width: 12),
                        //     itemBuilder: (context, index) {
                        //       final titles = ['Anime', '3D', 'Cyberpunk', 'Cyber'];
                        //       final images = [
                        //         'assets/icons/Icon-1.svg',
                        //         'assets/icons/Icon-2.svg',
                        //         'assets/icons/Icon-3.svg',
                        //         'assets/icons/Icon-4.svg',
                        //       ];
                        //       return _StyleCard(
                        //         title: titles[index],
                        //         image: images[index],
                        //         selected: viewModel.selectedStyle == index,
                        //         onTap: () => viewModel.setStyle(index),
                        //       );
                        //     },
                        //   ),
                        // ),
                        // LayoutConstants.emptyHeight20,
                        // Kimler görebilir
                        // Row(
                        //   children: [
                        //     Expanded(
                        //       child: GestureDetector(
                        //         onTap: () => viewModel.setOnlyMe(false),
                        //         child: Row(
                        //           children: [
                        //             Icon(
                        //               Icons.group,
                        //               color: !viewModel.onlyMe ? AppColors.purple500 : AppColors.gray400,
                        //               size: 20,
                        //             ),
                        //             const SizedBox(width: 8),
                        //             Text(
                        //               'Kimler görebilir?',
                        //               style: AppTextStyles.textSmRegular.copyWith(
                        //                 color: !viewModel.onlyMe ? AppColors.purple500 : AppColors.gray400,
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //     GestureDetector(
                        //       onTap: () => viewModel.setOnlyMe(true),
                        //       child: Row(
                        //         children: [
                        //           Icon(
                        //             Icons.lock,
                        //             color: viewModel.onlyMe ? AppColors.purple500 : AppColors.gray400,
                        //             size: 20,
                        //           ),
                        //           const SizedBox(width: 8),
                        //           Text(
                        //             'Sadece ben',
                        //             style: AppTextStyles.textSmRegular.copyWith(
                        //               color: viewModel.onlyMe ? AppColors.purple500 : AppColors.gray400,
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // LayoutConstants.emptyHeight24,
                        // Oluştur butonu
                        SizedBox(
                          width: double.infinity,
                          child: CustomButton(
                            text: 'Oluştur',
                            enabled: viewModel.isCreateEnabled && !viewModel.isLoading,
                            onPressed: viewModel.isCreateEnabled ? () async => await viewModel.createContent() : null,
                          ),
                        ),
                        LayoutConstants.emptyHeight8,
                        if (viewModel.isLoading)
                          const Center(
                            child: Padding(padding: EdgeInsets.all(8.0), child: CircularProgressIndicator()),
                          ),
                        if (viewModel.errorMessage != null)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(viewModel.errorMessage!, style: TextStyle(color: Colors.red)),
                          ),
                        if (viewModel.aiResponse != null)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Başarılı! Görsel URL: ${viewModel.aiResponse?.imageUrl ?? ''}',
                              style: TextStyle(color: Colors.green),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Container _content(HomeViewModel viewModel) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.gray900,
        borderRadius: LayoutConstants.border8Button,
        border: Border.all(color: AppColors.gray700),
      ),
      padding: LayoutConstants.padding12All,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: AppColors.gray800, borderRadius: LayoutConstants.border8Button),
            child: Row(
              children: [
                _HomeTabButton(
                  text: 'Açıklama',
                  selected: viewModel.activeTab == HomeTab.description,
                  onTap: () => viewModel.setTab(HomeTab.description),
                ),
                _HomeTabButton(
                  text: 'Görsel',
                  selected: viewModel.activeTab == HomeTab.image,
                  onTap: () => viewModel.setTab(HomeTab.image),
                ),
              ],
            ),
          ),
          LayoutConstants.emptyHeight12,
          // Tab içerikleri
          if (viewModel.activeTab == HomeTab.description)
            _DescriptionTab(viewModel: viewModel)
          else
            _ImageTab(viewModel: viewModel),

          if (viewModel.activeTab == HomeTab.description)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: SvgPicture.asset(ImageConstants.instance.svgAssets.surpriseMe, color: AppColors.white),
                  label: Text('Surprise me', style: AppTextStyles.textSmBold.copyWith(color: AppColors.white)),
                ),
                // Text(
                //   '${viewModel.descriptionLength}/${HomeViewModel.maxDescriptionLength}',
                //   style: AppTextStyles.textSmRegular.copyWith(color: AppColors.gray400),
                // ),
              ],
            ),
        ],
      ),
    );
  }
}

class _UpgradeButton extends StatelessWidget {
  const _UpgradeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.purple600,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      onPressed: () {},
      icon: SvgPicture.asset(ImageConstants.instance.svgAssets.upgrade, color: AppColors.white),
      label: Text('Yükselt', style: AppTextStyles.textSmSemibold.copyWith(color: Colors.white)),
    );
  }
}

class _HomeTabButton extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onTap;
  const _HomeTabButton({required this.text, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: LayoutConstants.padding8All,
          decoration:
              selected
                  ? BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: LayoutConstants.border8Button,
                    border: Border.all(color: selected ? AppColors.gray200 : Colors.white.withOpacity(0.08), width: 2),
                  )
                  : BoxDecoration(color: Colors.transparent),
          alignment: Alignment.center,
          child: Text(
            text,
            style: AppTextStyles.textSmRegular.copyWith(color: selected ? AppColors.white : AppColors.gray400),
          ),
        ),
      ),
    );
  }
}

class _DescriptionTab extends StatelessWidget {
  final HomeViewModel viewModel;
  const _DescriptionTab({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: viewModel.descriptionController,
      maxLines: 6,
      maxLength: HomeViewModel.maxDescriptionLength,
      style: AppTextStyles.textMdRegular.copyWith(color: AppColors.white),
      decoration: InputDecoration(
        hintText: 'Açıklama giriniz...',
        hintStyle: AppTextStyles.textMdRegular.copyWith(color: AppColors.gray400),
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        counterText: '',
      ),
    );
  }
}

class _ImageTab extends StatelessWidget {
  final HomeViewModel viewModel;
  const _ImageTab({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return viewModel.imagePath == null
        ? GestureDetector(
          onTap: viewModel.pickImage,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LayoutConstants.emptyHeight24,
              SvgPicture.asset(ImageConstants.instance.svgAssets.upload, color: AppColors.white, width: 32, height: 32),
              LayoutConstants.emptyHeight4,
              Text('Görsel Yükle', style: AppTextStyles.textMdSemibold.copyWith(color: AppColors.white)),
              LayoutConstants.emptyHeight8,
              Text(
                'Fotoğraflarınızı yapay zeka tarafından hazırlanmış videolarla yaşayan anılara dönüştürün!',
                style: AppTextStyles.textXsRegular.copyWith(color: AppColors.gray400),
                textAlign: TextAlign.center,
              ),
              LayoutConstants.emptyHeight24,
            ],
          ),
        )
        : Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.file(viewModel.imageFile!, width: 156, height: 156, fit: BoxFit.cover),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // viewModel.imageFile?.path.split('/').last ?? '',
                    'Görsel',
                    style: AppTextStyles.textSmBold.copyWith(color: AppColors.white),
                  ),
                  Text(
                    '${viewModel.imageSizeMB ?? 0} MB',
                    style: AppTextStyles.textSmRegular.copyWith(color: AppColors.gray400),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: viewModel.removeImage,
              child: Container(
                padding: LayoutConstants.padding8All,
                decoration: BoxDecoration(
                  color: AppColors.red500,
                  borderRadius: LayoutConstants.border8Button,
                  border: Border.all(color: AppColors.gray700),
                ),
                child: SvgPicture.asset(ImageConstants.instance.svgAssets.delete, color: AppColors.white),
              ),
            ),
          ],
        );
  }
}

class _SizeButton extends StatelessWidget {
  final VideoSize size;
  final HomeViewModel viewModel;
  const _SizeButton({required this.size, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final selected = viewModel.selectedSize == size;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: GestureDetector(
          onTap: () => viewModel.setSize(size),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            decoration: BoxDecoration(
              color: selected ? AppColors.gray800 : AppColors.gray900,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: selected ? AppColors.gray200 : AppColors.gray700, width: 2),
            ),
            alignment: Alignment.center,
            child: Text(
              size.name,
              style: AppTextStyles.textSmRegular.copyWith(color: selected ? AppColors.white : AppColors.gray400),
            ),
          ),
        ),
      ),
    );
  }
}

class _StyleCard extends StatelessWidget {
  final String title;
  final String image;
  final bool selected;
  final VoidCallback onTap;
  const _StyleCard({required this.title, required this.image, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        decoration: BoxDecoration(
          color: selected ? AppColors.primary800 : AppColors.primary900,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: selected ? AppColors.purple500 : Colors.white.withOpacity(0.08), width: 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Burada image yerine asset veya svg kullanılabilir
            const SizedBox(height: 12),
            Icon(Icons.image, size: 32, color: AppColors.gray400),
            const SizedBox(height: 8),
            Text(title, style: AppTextStyles.textSmBold.copyWith(color: AppColors.white)),
          ],
        ),
      ),
    );
  }
}
