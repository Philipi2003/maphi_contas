// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dependency_injection.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(helloWorld)
final helloWorldProvider = HelloWorldProvider._();

final class HelloWorldProvider
    extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  HelloWorldProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'helloWorldProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$helloWorldHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return helloWorld(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$helloWorldHash() => r'b7550791faf7884e172d213f6c03f55d7302458d';

@ProviderFor(authRepository)
final authRepositoryProvider = AuthRepositoryProvider._();

final class AuthRepositoryProvider
    extends
        $FunctionalProvider<
          AuthRepositoryInterface,
          AuthRepositoryInterface,
          AuthRepositoryInterface
        >
    with $Provider<AuthRepositoryInterface> {
  AuthRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRepositoryHash();

  @$internal
  @override
  $ProviderElement<AuthRepositoryInterface> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AuthRepositoryInterface create(Ref ref) {
    return authRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthRepositoryInterface value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthRepositoryInterface>(value),
    );
  }
}

String _$authRepositoryHash() => r'12b5f3afd7ec3af11ea54633f10e71741fed9523';

@ProviderFor(initializeGoogleSignIn)
final initializeGoogleSignInProvider = InitializeGoogleSignInProvider._();

final class InitializeGoogleSignInProvider
    extends
        $FunctionalProvider<
          InitializeGoogleSignInUsecase,
          InitializeGoogleSignInUsecase,
          InitializeGoogleSignInUsecase
        >
    with $Provider<InitializeGoogleSignInUsecase> {
  InitializeGoogleSignInProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'initializeGoogleSignInProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$initializeGoogleSignInHash();

  @$internal
  @override
  $ProviderElement<InitializeGoogleSignInUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  InitializeGoogleSignInUsecase create(Ref ref) {
    return initializeGoogleSignIn(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InitializeGoogleSignInUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InitializeGoogleSignInUsecase>(
        value,
      ),
    );
  }
}

String _$initializeGoogleSignInHash() =>
    r'3097ffb1f154959e1b5010f3f8afaa95fc2f8b24';
