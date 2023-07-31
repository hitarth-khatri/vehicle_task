import 'package:get/get.dart';
import 'package:vehicle_task/common/enums/loading_status.dart';
import 'package:vehicle_task/models/vehicle_model.dart';

class HomeState {
  RxList<VehicleModel> vehicleModelList = <VehicleModel>[].obs;
  DateTime dateTime = DateTime.now();

  Rx<LoadStatus> loadStatus = LoadStatus.initial.obs;
}
