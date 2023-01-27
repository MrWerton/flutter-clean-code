import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arch/common/error/failures.dart';
import '../entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, void>> create({required User user});
  Future<Either<Failure, void>> getAll();
  Future<Either<Failure, void>> get({required String id});
}
