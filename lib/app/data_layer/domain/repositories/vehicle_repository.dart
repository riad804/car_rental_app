import 'package:car_rental_app/app/data_layer/data/remote/api/responses/vehicle_data.dart';

import '../../../core/utils/type_defs.dart';

abstract class VehicleRepository {
  ResultFuture<List<VehicleData>> getVehicleList();

  ResultFuture<VehicleData> getVehicleDetails({required String id});

  ResultVoid vehicleRent({required String id});
}