// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scaffold_messenger_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String _$scaffoldMessengerKeyHash() =>
    r'f948605d97f22f11bf403c941e735818ef19ec71';

/// See also [scaffoldMessengerKey].
final scaffoldMessengerKeyProvider =
    AutoDisposeProvider<GlobalKey<ScaffoldMessengerState>>(
  scaffoldMessengerKey,
  name: r'scaffoldMessengerKeyProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$scaffoldMessengerKeyHash,
);
typedef ScaffoldMessengerKeyRef
    = AutoDisposeProviderRef<GlobalKey<ScaffoldMessengerState>>;
String _$scaffoldMessengerServiceHash() =>
    r'f7abfde2a51e8f42837e15caa441a3573f3d60ca';

/// See also [scaffoldMessengerService].
final scaffoldMessengerServiceProvider =
    AutoDisposeProvider<ScaffoldMessengerService>(
  scaffoldMessengerService,
  name: r'scaffoldMessengerServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$scaffoldMessengerServiceHash,
);
typedef ScaffoldMessengerServiceRef
    = AutoDisposeProviderRef<ScaffoldMessengerService>;
