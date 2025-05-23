import 'package:injectable/injectable.dart';

import '../../../../core/di/di_container.dart';
import '../../../../core/utils/type_defs.dart';
import '../../../../core/utils/use_cases.dart';
import '../../../data/remote/api/responses/vehicle_data.dart';
import '../../repositories/vehicle_repository.dart';

@Singleton()
class GetVehicleList extends UseCaseWithoutParams<List<VehicleData>> {
  @override
  ResultFuture<List<VehicleData>> call() {
    return sl<VehicleRepository>().getVehicleList();
  }
}