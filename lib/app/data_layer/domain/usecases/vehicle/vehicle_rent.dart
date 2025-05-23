import 'package:injectable/injectable.dart';

import '../../../../core/di/di_container.dart';
import '../../../../core/utils/type_defs.dart';
import '../../../../core/utils/use_cases.dart';
import '../../repositories/vehicle_repository.dart';

@Singleton()
class VehicleRent extends UseCaseWithParams<void, String> {
  @override
  ResultVoid call(String params) {
    return sl<VehicleRepository>().vehicleRent(id: params);
  }
}