import 'package:flutter_test/flutter_test.dart';
import 'package:maphi_contas/auth/domain/repositories/auth_repository_interface.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<AuthRepositoryInterface>()])
import 'sign_in_usecase_test.mocks.dart';

void main() {
  test("Retorna um GoogleUser, quando a operação dá certo", (){
    when(AuthRepo)
  });
}
