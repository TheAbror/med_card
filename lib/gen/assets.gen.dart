/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  $AssetsIconsDownloaderGen get downloader => const $AssetsIconsDownloaderGen();
  $AssetsIconsHomeTabIconsGen get homeTabIcons =>
      const $AssetsIconsHomeTabIconsGen();
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Frame 1.png
  AssetGenImage get frame1 => const AssetGenImage('assets/images/Frame 1.png');

  /// File path: assets/images/Logo - 4x.png
  AssetGenImage get logo4x =>
      const AssetGenImage('assets/images/Logo - 4x.png');

  $AssetsImagesStoresGen get stores => const $AssetsImagesStoresGen();

  /// List of all assets
  List<AssetGenImage> get values => [frame1, logo4x];
}

class $AssetsIconsDownloaderGen {
  const $AssetsIconsDownloaderGen();

  /// File path: assets/icons/downloader/docx.svg
  SvgGenImage get docx => const SvgGenImage('assets/icons/downloader/docx.svg');

  /// File path: assets/icons/downloader/down_icon.svg
  SvgGenImage get downIcon =>
      const SvgGenImage('assets/icons/downloader/down_icon.svg');

  /// File path: assets/icons/downloader/logout_icon.svg
  SvgGenImage get logoutIcon =>
      const SvgGenImage('assets/icons/downloader/logout_icon.svg');

  /// File path: assets/icons/downloader/moon.svg
  SvgGenImage get moon => const SvgGenImage('assets/icons/downloader/moon.svg');

  /// File path: assets/icons/downloader/other.svg
  SvgGenImage get other =>
      const SvgGenImage('assets/icons/downloader/other.svg');

  /// File path: assets/icons/downloader/pdf.svg
  SvgGenImage get pdf => const SvgGenImage('assets/icons/downloader/pdf.svg');

  /// File path: assets/icons/downloader/ppt.svg
  SvgGenImage get ppt => const SvgGenImage('assets/icons/downloader/ppt.svg');

  /// File path: assets/icons/downloader/xlsx.svg
  SvgGenImage get xlsx => const SvgGenImage('assets/icons/downloader/xlsx.svg');

  /// File path: assets/icons/downloader/zip.svg
  SvgGenImage get zip => const SvgGenImage('assets/icons/downloader/zip.svg');

  /// List of all assets
  List<SvgGenImage> get values =>
      [docx, downIcon, logoutIcon, moon, other, pdf, ppt, xlsx, zip];
}

class $AssetsIconsHomeTabIconsGen {
  const $AssetsIconsHomeTabIconsGen();

  /// File path: assets/icons/home_tab_icons/Indicator.svg
  SvgGenImage get indicator =>
      const SvgGenImage('assets/icons/home_tab_icons/Indicator.svg');

  /// File path: assets/icons/home_tab_icons/certificate.png
  AssetGenImage get certificate =>
      const AssetGenImage('assets/icons/home_tab_icons/certificate.png');

  /// File path: assets/icons/home_tab_icons/confetti_bottom.png
  AssetGenImage get confettiBottom =>
      const AssetGenImage('assets/icons/home_tab_icons/confetti_bottom.png');

  /// File path: assets/icons/home_tab_icons/confetti_main.png
  AssetGenImage get confettiMain =>
      const AssetGenImage('assets/icons/home_tab_icons/confetti_main.png');

  /// File path: assets/icons/home_tab_icons/confetti_top.png
  AssetGenImage get confettiTop =>
      const AssetGenImage('assets/icons/home_tab_icons/confetti_top.png');

  /// File path: assets/icons/home_tab_icons/cup.png
  AssetGenImage get cup =>
      const AssetGenImage('assets/icons/home_tab_icons/cup.png');

  /// File path: assets/icons/home_tab_icons/share.svg
  SvgGenImage get share =>
      const SvgGenImage('assets/icons/home_tab_icons/share.svg');

  /// List of all assets
  List<dynamic> get values => [
        indicator,
        certificate,
        confettiBottom,
        confettiMain,
        confettiTop,
        cup,
        share
      ];
}

class $AssetsImagesStoresGen {
  const $AssetsImagesStoresGen();

  /// File path: assets/images/stores/google_play.png
  AssetGenImage get googlePlay =>
      const AssetGenImage('assets/images/stores/google_play.png');

  /// File path: assets/images/stores/ios_app_store.png
  AssetGenImage get iosAppStore =>
      const AssetGenImage('assets/images/stores/ios_app_store.png');

  /// File path: assets/images/stores/maintenance.svg
  SvgGenImage get maintenance =>
      const SvgGenImage('assets/images/stores/maintenance.svg');

  /// List of all assets
  List<dynamic> get values => [googlePlay, iosAppStore, maintenance];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
