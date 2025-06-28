import 'package:photofiy/core/utils/errors/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Result> call(Params params);
}

class NoParams {}
