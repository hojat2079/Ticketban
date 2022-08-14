/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsImageGen {
  const $AssetsImageGen();

  $AssetsImagePngGen get png => const $AssetsImagePngGen();
  $AssetsImageSvgGen get svg => const $AssetsImageSvgGen();
}

class $AssetsImagePngGen {
  const $AssetsImagePngGen();

  /// File path: assets/image/png/avatar.png
  AssetGenImage get avatar =>
      const AssetGenImage('assets/image/png/avatar.png');

  /// File path: assets/image/png/banner.png
  AssetGenImage get banner =>
      const AssetGenImage('assets/image/png/banner.png');
}

class $AssetsImageSvgGen {
  const $AssetsImageSvgGen();

  /// File path: assets/image/svg/all_ticket.svg
  SvgGenImage get allTicket =>
      const SvgGenImage('assets/image/svg/all_ticket.svg');

  /// File path: assets/image/svg/arrow.svg
  SvgGenImage get arrow => const SvgGenImage('assets/image/svg/arrow.svg');

  /// File path: assets/image/svg/check.svg
  SvgGenImage get check => const SvgGenImage('assets/image/svg/check.svg');

  /// File path: assets/image/svg/delete.svg
  SvgGenImage get delete => const SvgGenImage('assets/image/svg/delete.svg');

  /// File path: assets/image/svg/empty.svg
  SvgGenImage get empty => const SvgGenImage('assets/image/svg/empty.svg');

  /// File path: assets/image/svg/exit.svg
  SvgGenImage get exit => const SvgGenImage('assets/image/svg/exit.svg');

  /// File path: assets/image/svg/file.svg
  SvgGenImage get file => const SvgGenImage('assets/image/svg/file.svg');

  /// File path: assets/image/svg/home.svg
  SvgGenImage get home => const SvgGenImage('assets/image/svg/home.svg');

  /// File path: assets/image/svg/lock.svg
  SvgGenImage get lock => const SvgGenImage('assets/image/svg/lock.svg');

  /// File path: assets/image/svg/logo.svg
  SvgGenImage get logo => const SvgGenImage('assets/image/svg/logo.svg');

  /// File path: assets/image/svg/my_ticket.svg
  SvgGenImage get myTicket =>
      const SvgGenImage('assets/image/svg/my_ticket.svg');

  /// File path: assets/image/svg/password.svg
  SvgGenImage get password =>
      const SvgGenImage('assets/image/svg/password.svg');

  /// File path: assets/image/svg/password_item.svg
  SvgGenImage get passwordItem =>
      const SvgGenImage('assets/image/svg/password_item.svg');

  /// File path: assets/image/svg/person.svg
  SvgGenImage get person => const SvgGenImage('assets/image/svg/person.svg');

  /// File path: assets/image/svg/phone.svg
  SvgGenImage get phone => const SvgGenImage('assets/image/svg/phone.svg');

  /// File path: assets/image/svg/search.svg
  SvgGenImage get search => const SvgGenImage('assets/image/svg/search.svg');

  /// File path: assets/image/svg/send.svg
  SvgGenImage get send => const SvgGenImage('assets/image/svg/send.svg');
}

class Assets {
  Assets._();

  static const $AssetsImageGen image = $AssetsImageGen();
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
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    bool cacheColorFilter = false,
    SvgTheme? theme,
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
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
      theme: theme,
    );
  }

  String get path => _assetName;
}
