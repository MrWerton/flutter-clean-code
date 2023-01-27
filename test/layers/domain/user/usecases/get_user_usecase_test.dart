import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_clean_arch/layers/domain/user/entities/user.dart';
import 'package:flutter_clean_arch/layers/domain/user/repositories/user_repository.dart';
import 'package:flutter_clean_arch/layers/domain/user/usecases/get_use_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';

class UserRepositoryMock extends Mock implements UserRepository {}

void main() {
  late UserRepository userRepositoryMock;
  late GetUserUseCase sut;

  setUp(() {
    userRepositoryMock = UserRepositoryMock();
    sut = GetUserUseCase(userRepository: userRepositoryMock);
  });

  test(
      'should call repository correctly and return a list one user with specific id',
      () async {
    final id = faker.guid.guid();
    final getUserParams = GetUserParams(id: id);
    final user = User(
        name: faker.person.firstName(), email: faker.internet.email(), id: id);

    when(() => userRepositoryMock.get(id: id))
        .thenAnswer((_) async => Right(user));

    final result = await sut.call(getUserParams);

    expect(result, Right(user));
    verify(() => userRepositoryMock.get(id: id)).called(1);
    verifyNoMoreInteractions(userRepositoryMock);
  });
}
