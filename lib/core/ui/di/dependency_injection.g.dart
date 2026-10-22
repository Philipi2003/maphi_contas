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

@ProviderFor(CurrentAuthState)
final currentAuthStateProvider = CurrentAuthStateProvider._();

final class CurrentAuthStateProvider
    extends
        $NotifierProvider<
          CurrentAuthState,
          Either<AppFailure, GoogleAuthState>
        > {
  CurrentAuthStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentAuthStateProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentAuthStateHash();

  @$internal
  @override
  CurrentAuthState create() => CurrentAuthState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Either<AppFailure, GoogleAuthState> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Either<AppFailure, GoogleAuthState>>(
        value,
      ),
    );
  }
}

String _$currentAuthStateHash() => r'fe0dd108aca3b87f8bec11c35fd4d7ded298e79b';

abstract class _$CurrentAuthState
    extends $Notifier<Either<AppFailure, GoogleAuthState>> {
  Either<AppFailure, GoogleAuthState> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<
              Either<AppFailure, GoogleAuthState>,
              Either<AppFailure, GoogleAuthState>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                Either<AppFailure, GoogleAuthState>,
                Either<AppFailure, GoogleAuthState>
              >,
              Either<AppFailure, GoogleAuthState>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(initializeGoogleAuthServiceUsecase)
final initializeGoogleAuthServiceUsecaseProvider =
    InitializeGoogleAuthServiceUsecaseProvider._();

final class InitializeGoogleAuthServiceUsecaseProvider
    extends
        $FunctionalProvider<
          InitializeGoogleAuthServiceUsecase,
          InitializeGoogleAuthServiceUsecase,
          InitializeGoogleAuthServiceUsecase
        >
    with $Provider<InitializeGoogleAuthServiceUsecase> {
  InitializeGoogleAuthServiceUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'initializeGoogleAuthServiceUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$initializeGoogleAuthServiceUsecaseHash();

  @$internal
  @override
  $ProviderElement<InitializeGoogleAuthServiceUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  InitializeGoogleAuthServiceUsecase create(Ref ref) {
    return initializeGoogleAuthServiceUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InitializeGoogleAuthServiceUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InitializeGoogleAuthServiceUsecase>(
        value,
      ),
    );
  }
}

String _$initializeGoogleAuthServiceUsecaseHash() =>
    r'2ce88cdd7067ac47415a6f3f2b26e27ff5d39b6e';

@ProviderFor(requestAuthorizationUsecase)
final requestAuthorizationUsecaseProvider =
    RequestAuthorizationUsecaseProvider._();

final class RequestAuthorizationUsecaseProvider
    extends
        $FunctionalProvider<
          RequestAuthorizationUsecase,
          RequestAuthorizationUsecase,
          RequestAuthorizationUsecase
        >
    with $Provider<RequestAuthorizationUsecase> {
  RequestAuthorizationUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'requestAuthorizationUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$requestAuthorizationUsecaseHash();

  @$internal
  @override
  $ProviderElement<RequestAuthorizationUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RequestAuthorizationUsecase create(Ref ref) {
    return requestAuthorizationUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RequestAuthorizationUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RequestAuthorizationUsecase>(value),
    );
  }
}

String _$requestAuthorizationUsecaseHash() =>
    r'02b6092d9191930d4ad524f5f800b87e4007d6af';

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

String _$authRepositoryHash() => r'e4fec15bf942b33c1c5f1b8fce58500a88771f52';

@ProviderFor(signInService)
final signInServiceProvider = SignInServiceProvider._();

final class SignInServiceProvider
    extends $FunctionalProvider<SignInService, SignInService, SignInService>
    with $Provider<SignInService> {
  SignInServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signInServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signInServiceHash();

  @$internal
  @override
  $ProviderElement<SignInService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SignInService create(Ref ref) {
    return signInService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SignInService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SignInService>(value),
    );
  }
}

String _$signInServiceHash() => r'66aeb68c37c579c3cabc572d5804a79455284579';

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

@ProviderFor(dotEnv)
final dotEnvProvider = DotEnvProvider._();

final class DotEnvProvider extends $FunctionalProvider<DotEnv, DotEnv, DotEnv>
    with $Provider<DotEnv> {
  DotEnvProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dotEnvProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dotEnvHash();

  @$internal
  @override
  $ProviderElement<DotEnv> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DotEnv create(Ref ref) {
    return dotEnv(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DotEnv value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DotEnv>(value),
    );
  }
}

String _$dotEnvHash() => r'83972fe1f5a556ddfdf85a980721a9cbbb6acb61';
