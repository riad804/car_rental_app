import 'package:car_rental_app/app/core/di/di_container.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final sl = GetIt.I;

@InjectableInit()
Future<void> initDi() async {
  sl.init();
  return sl.allReady();
}