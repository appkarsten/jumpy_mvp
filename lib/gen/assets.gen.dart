/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// Directory path: assets/images/jcons
  $AssetsImagesJconsGen get jcons => const $AssetsImagesJconsGen();

  /// Directory path: assets/images/menu
  $AssetsImagesMenuGen get menu => const $AssetsImagesMenuGen();

  /// Directory path: assets/images/power_animals
  $AssetsImagesPowerAnimalsGen get powerAnimals =>
      const $AssetsImagesPowerAnimalsGen();

  /// Directory path: assets/images/users
  $AssetsImagesUsersGen get users => const $AssetsImagesUsersGen();
}

class $AssetsImagesJconsGen {
  const $AssetsImagesJconsGen();

  /// File path: assets/images/jcons/badge.svg
  SvgGenImage get badge => const SvgGenImage('assets/images/jcons/badge.svg');

  /// List of all assets
  List<SvgGenImage> get values => [badge];
}

class $AssetsImagesMenuGen {
  const $AssetsImagesMenuGen();

  /// File path: assets/images/menu/challenges.svg
  SvgGenImage get challenges =>
      const SvgGenImage('assets/images/menu/challenges.svg');

  /// File path: assets/images/menu/friends.svg
  SvgGenImage get friends =>
      const SvgGenImage('assets/images/menu/friends.svg');

  /// File path: assets/images/menu/home.svg
  SvgGenImage get home => const SvgGenImage('assets/images/menu/home.svg');

  /// File path: assets/images/menu/ranking.svg
  SvgGenImage get ranking =>
      const SvgGenImage('assets/images/menu/ranking.svg');

  /// List of all assets
  List<SvgGenImage> get values => [challenges, friends, home, ranking];
}

class $AssetsImagesPowerAnimalsGen {
  const $AssetsImagesPowerAnimalsGen();

  /// File path: assets/images/power_animals/lama.png
  AssetGenImage get lama =>
      const AssetGenImage('assets/images/power_animals/lama.png');

  /// File path: assets/images/power_animals/monkey.png
  AssetGenImage get monkey =>
      const AssetGenImage('assets/images/power_animals/monkey.png');

  /// File path: assets/images/power_animals/octopus.png
  AssetGenImage get octopus =>
      const AssetGenImage('assets/images/power_animals/octopus.png');

  /// File path: assets/images/power_animals/penguin.png
  AssetGenImage get penguin =>
      const AssetGenImage('assets/images/power_animals/penguin.png');

  /// File path: assets/images/power_animals/raccoon.png
  AssetGenImage get raccoon =>
      const AssetGenImage('assets/images/power_animals/raccoon.png');

  /// List of all assets
  List<AssetGenImage> get values => [lama, monkey, octopus, penguin, raccoon];
}

class $AssetsImagesUsersGen {
  const $AssetsImagesUsersGen();

  /// File path: assets/images/users/user_1.jpg
  AssetGenImage get user1 =>
      const AssetGenImage('assets/images/users/user_1.jpg');

  /// File path: assets/images/users/user_10.jpg
  AssetGenImage get user10 =>
      const AssetGenImage('assets/images/users/user_10.jpg');

  /// File path: assets/images/users/user_11.jpg
  AssetGenImage get user11 =>
      const AssetGenImage('assets/images/users/user_11.jpg');

  /// File path: assets/images/users/user_2.jpg
  AssetGenImage get user2 =>
      const AssetGenImage('assets/images/users/user_2.jpg');

  /// File path: assets/images/users/user_3.jpg
  AssetGenImage get user3 =>
      const AssetGenImage('assets/images/users/user_3.jpg');

  /// File path: assets/images/users/user_4.jpg
  AssetGenImage get user4 =>
      const AssetGenImage('assets/images/users/user_4.jpg');

  /// File path: assets/images/users/user_5.jpg
  AssetGenImage get user5 =>
      const AssetGenImage('assets/images/users/user_5.jpg');

  /// File path: assets/images/users/user_6.jpg
  AssetGenImage get user6 =>
      const AssetGenImage('assets/images/users/user_6.jpg');

  /// File path: assets/images/users/user_7.jpg
  AssetGenImage get user7 =>
      const AssetGenImage('assets/images/users/user_7.jpg');

  /// File path: assets/images/users/user_8.jpg
  AssetGenImage get user8 =>
      const AssetGenImage('assets/images/users/user_8.jpg');

  /// File path: assets/images/users/user_9.jpg
  AssetGenImage get user9 =>
      const AssetGenImage('assets/images/users/user_9.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [
        user1,
        user10,
        user11,
        user2,
        user3,
        user4,
        user5,
        user6,
        user7,
        user8,
        user9
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
    bool gaplessPlayback = true,
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
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
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
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
