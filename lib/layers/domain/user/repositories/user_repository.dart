import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arch/common/error/failures.dart';
import '../entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, void>> create({required User user});
  Future<Either<Failure, List<User>>> getAll();
  Future<Either<Failure, User>> get({required String id});
}
