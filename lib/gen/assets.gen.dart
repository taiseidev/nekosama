/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/cat_walk.gif
  AssetGenImage get catWalk =>
      const AssetGenImage('assets/images/cat_walk.gif');

  /// File path: assets/images/nikukyu.png
  AssetGenImage get nikukyu => const AssetGenImage('assets/images/nikukyu.png');

  /// List of all assets
  List<AssetGenImage> get values => [catWalk, nikukyu];
}

class $AssetsLoadingGen {
  const $AssetsLoadingGen();

  /// File path: assets/loading/not_found_loading.json
  String get notFoundLoading => 'assets/loading/not_found_loading.json';

  /// File path: assets/loading/primary_loading.json
  String get primaryLoading => 'assets/loading/primary_loading.json';

  /// List of all assets
  List<String> get values => [notFoundLoading, primaryLoading];
}

class $AssetsPostGen {
  const $AssetsPostGen();

  /// File path: assets/post/cat.svg
  String get cat => 'assets/post/cat.svg';

  /// File path: assets/post/comment.svg
  String get comment => 'assets/post/comment.svg';

  /// List of all assets
  List<String> get values => [cat, comment];
}

class $AssetsTabsGen {
  const $AssetsTabsGen();

  /// File path: assets/tabs/add.svg
  String get add => 'assets/tabs/add.svg';

  /// File path: assets/tabs/home.svg
  String get home => 'assets/tabs/home.svg';

  /// File path: assets/tabs/search.svg
  String get search => 'assets/tabs/search.svg';

  /// File path: assets/tabs/user.svg
  String get user => 'assets/tabs/user.svg';

  /// List of all assets
  List<String> get values => [add, home, search, user];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLoadingGen loading = $AssetsLoadingGen();
  static const AssetGenImage logo = AssetGenImage('assets/logo.png');
  static const $AssetsPostGen post = $AssetsPostGen();
  static const $AssetsTabsGen tabs = $AssetsTabsGen();

  /// List of all assets
  List<AssetGenImage> get values => [logo];
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

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
