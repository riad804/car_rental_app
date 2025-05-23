import 'package:injectable/injectable.dart';

import '../../../../core/di/di_container.dart';
import '../../../../core/utils/type_defs.dart';
import '../../../../core/utils/use_cases.dart';
import '../../../data/remote/api/responses/vehicle_data.dart';
import '../../repositories/vehicle_repository.dart';

@Singleton()
class GetVehicleDetails extends UseCaseWithParams<VehicleData, String> {
  @override
  ResultFuture<VehicleData> call(String params) {
    return sl<VehicleRepository>().getVehicleDetails(id: params);
  }
}