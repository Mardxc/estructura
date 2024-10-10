// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$saveProductCaptureHash() =>
    r'50610588edad5fd642eb266a000e366bcbcfb2e1';

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

/// See also [saveProductCapture].
@ProviderFor(saveProductCapture)
const saveProductCaptureProvider = SaveProductCaptureFamily();

/// See also [saveProductCapture].
class SaveProductCaptureFamily extends Family<AsyncValue<String>> {
  /// See also [saveProductCapture].
  const SaveProductCaptureFamily();

  /// See also [saveProductCapture].
  SaveProductCaptureProvider call(
    ProductsCaptureRequestModel obj,
  ) {
    return SaveProductCaptureProvider(
      obj,
    );
  }

  @override
  SaveProductCaptureProvider getProviderOverride(
    covariant SaveProductCaptureProvider provider,
  ) {
    return call(
      provider.obj,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'saveProductCaptureProvider';
}

/// See also [saveProductCapture].
class SaveProductCaptureProvider extends AutoDisposeFutureProvider<String> {
  /// See also [saveProductCapture].
  SaveProductCaptureProvider(
    ProductsCaptureRequestModel obj,
  ) : this._internal(
          (ref) => saveProductCapture(
            ref as SaveProductCaptureRef,
            obj,
          ),
          from: saveProductCaptureProvider,
          name: r'saveProductCaptureProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$saveProductCaptureHash,
          dependencies: SaveProductCaptureFamily._dependencies,
          allTransitiveDependencies:
              SaveProductCaptureFamily._allTransitiveDependencies,
          obj: obj,
        );

  SaveProductCaptureProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.obj,
  }) : super.internal();

  final ProductsCaptureRequestModel obj;

  @override
  Override overrideWith(
    FutureOr<String> Function(SaveProductCaptureRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SaveProductCaptureProvider._internal(
        (ref) => create(ref as SaveProductCaptureRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        obj: obj,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _SaveProductCaptureProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SaveProductCaptureProvider && other.obj == obj;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, obj.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SaveProductCaptureRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `obj` of this provider.
  ProductsCaptureRequestModel get obj;
}

class _SaveProductCaptureProviderElement
    extends AutoDisposeFutureProviderElement<String>
    with SaveProductCaptureRef {
  _SaveProductCaptureProviderElement(super.provider);

  @override
  ProductsCaptureRequestModel get obj =>
      (origin as SaveProductCaptureProvider).obj;
}

String _$changeOtraPromocionHash() =>
    r'851485a3f772ef50e61b8a118ba817f79eefcb73';

/// See also [ChangeOtraPromocion].
@ProviderFor(ChangeOtraPromocion)
final changeOtraPromocionProvider =
    AutoDisposeNotifierProvider<ChangeOtraPromocion, bool>.internal(
  ChangeOtraPromocion.new,
  name: r'changeOtraPromocionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$changeOtraPromocionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ChangeOtraPromocion = AutoDisposeNotifier<bool>;
String _$changePromocionSelectHash() =>
    r'0184534635391cf7ecad3e800a1800e2a2bcf131';

/// See also [ChangePromocionSelect].
@ProviderFor(ChangePromocionSelect)
final changePromocionSelectProvider =
    AutoDisposeNotifierProvider<ChangePromocionSelect, String>.internal(
  ChangePromocionSelect.new,
  name: r'changePromocionSelectProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$changePromocionSelectHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ChangePromocionSelect = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
