// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'env.dart';

// **************************************************************************
// EnviedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _AppEnv {
  static const List<int> _enviedkeybaseUrlStaging = <int>[];

  static const List<int> _envieddatabaseUrlStaging = <int>[];

  static final String baseUrlStaging = String.fromCharCodes(List<int>.generate(
    _envieddatabaseUrlStaging.length,
    (int i) => i,
    growable: false,
  ).map((int i) => _envieddatabaseUrlStaging[i] ^ _enviedkeybaseUrlStaging[i]));

  static const List<int> _enviedkeybaseUrlProd = <int>[];

  static const List<int> _envieddatabaseUrlProd = <int>[];

  static final String baseUrlProd = String.fromCharCodes(List<int>.generate(
    _envieddatabaseUrlProd.length,
    (int i) => i,
    growable: false,
  ).map((int i) => _envieddatabaseUrlProd[i] ^ _enviedkeybaseUrlProd[i]));
}
