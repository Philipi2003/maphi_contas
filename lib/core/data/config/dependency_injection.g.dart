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

@ProviderFor(initializeGoogleSignInUseCase)
final initializeGoogleSignInUseCaseProvider =
    InitializeGoogleSignInUseCaseProvider._();

final class InitializeGoogleSignInUseCaseProvider
    extends
        $FunctionalProvider<
          InitializeGoogleSignInUsecase,
          InitializeGoogleSignInUsecase,
          InitializeGoogleSignInUsecase
        >
    with $Provider<InitializeGoogleSignInUsecase> {
  InitializeGoogleSignInUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'initializeGoogleSignInUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$initializeGoogleSignInUseCaseHash();

  @$internal
  @override
  $ProviderElement<InitializeGoogleSignInUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  InitializeGoogleSignInUsecase create(Ref ref) {
    return initializeGoogleSignInUseCase(ref);
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

String _$initializeGoogleSignInUseCaseHash() =>
    r'0c1988aff48ec8273eeba6d631e9de1fdae2c764';

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

String _$authRepositoryHash() => r'85003acfe4ae2f12696cfe24a3eb7ba510c180cf';

@ProviderFor(googleSignInInstance)
final googleSignInInstanceProvider = GoogleSignInInstanceProvider._();

final class GoogleSignInInstanceProvider
    extends $FunctionalProvider<GoogleSignIn, GoogleSignIn, GoogleSignIn>
    with $Provider<GoogleSignIn> {
  GoogleSignInInstanceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'googleSignInInstanceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$googleSignInInstanceHash();

  @$internal
  @override
  $ProviderElement<GoogleSignIn> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GoogleSignIn create(Ref ref) {
    return googleSignInInstance(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoogleSignIn value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoogleSignIn>(value),
    );
  }
}

String _$googleSignInInstanceHash() =>
    r'68eedc379809c4798d0cf0406348c8e8b409d65f';
