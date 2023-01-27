// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:flutter_clean_arch/common/error/failures.dart';
import 'package:flutter_clean_arch/common/usecase/usecase.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

class GetUserUseCase implements UseCase<User, GetUserParams> {
  final UserRepository _userRepository;
  GetUserUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<Either<Failure, User>> call(GetUserParams params) async {
    final id = params.id;

    return await _userRepository.get(id: id);
  }
}

class GetUserParams {
  final String id;
  GetUserParams({
    required this.id,
  });
}
