import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:maphi_contas/auth/domain/repositories/auth_repository_interface.dart';
import 'package:maphi_contas/auth/domain/usecases/sign_out_usecase.dart';
import 'package:maphi_contas/core/domain/failures/app_failure.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'sign_out_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AuthRepositoryInterface>()])
void main() {
  late MockAuthRepositoryInterface anyRepository;

  setUp(() {
    provideDummy<Either<AppFailure, void>>(
      Left(AppFailure(message: "Erro qualquer")),
    );
    anyRepository = MockAuthRepositoryInterface();
  });

  test("Quando tudo der certo no SignOut, deve retornar um null", () async {
    when(anyRepository.signOut())
        .thenAnswer((realInvocation) => Future.value(Right(null)));

    final usecase = SignOutUsecase(repository: anyRepository);

    expect(await usecase.call(), Right(null));
  });

  test(
    "Quando algo der errado no SignOut, deve retornar um AppFailure",
    () async {
      when(anyRepository.signOut()).thenAnswer(
        (realInvocation) =>
            Future.value(Left(AppFailure(message: "Erro qualquer"))),
      );

      final usecase = SignOutUsecase(repository: anyRepository);

      expect(await usecase.call(), Left(AppFailure(message: "Erro qualquer")));
    },
  );
}
