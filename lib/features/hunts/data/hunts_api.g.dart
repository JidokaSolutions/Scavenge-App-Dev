// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hunts_api.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(huntApi)
const huntApiProvider = HuntApiProvider._();

final class HuntApiProvider
    extends $FunctionalProvider<HuntsApi, HuntsApi, HuntsApi>
    with $Provider<HuntsApi> {
  const HuntApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'huntApiProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$huntApiHash();

  @$internal
  @override
  $ProviderElement<HuntsApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  HuntsApi create(Ref ref) {
    return huntApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HuntsApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HuntsApi>(value),
    );
  }
}

String _$huntApiHash() => r'64c31a197460bd3fe1a900a9b535fa337fb8da97';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
