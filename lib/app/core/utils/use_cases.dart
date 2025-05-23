import 'package:car_rental_app/app/core/utils/type_defs.dart';

abstract class UseCaseWithParams<Type, Params> {
  const UseCaseWithParams();

  ResultFuture<Type> call(Params params);
}

abstract class UseCaseWithoutParams<Type> {
  const UseCaseWithoutParams();

  ResultFuture<Type> call();
}

abstract class PrefUseCaseWithParams<Type, Params> {
  const PrefUseCaseWithParams();

  Type call(Params params);
}

abstract class PrefUseCaseWithoutParams<Type> {
  const PrefUseCaseWithoutParams();

  Type call();
}
