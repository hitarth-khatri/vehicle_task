import 'package:get/get.dart';
import 'package:vehicle_task/common/enums/loading_status.dart';
import 'package:vehicle_task/models/common_response.dart';
import 'package:vehicle_task/models/vehicle_model.dart';
import 'package:vehicle_task/pages/home/home_state.dart';
import 'package:vehicle_task/repository/auth_repository.dart';

import '../../utils/logger_util.dart';

class HomeController extends GetxController {
  HomeState homeState = HomeState();
  final AuthRepository _authRepository = Get.find<AuthRepository>();

  @override
  void onInit() {
    getVehicleList();
    super.onInit();
  }

  Future<void> getVehicleList() async {
    try {
      homeState.loadStatus.value = LoadStatus.loading;

      CommonResponse commonResponse = await _authRepository.getVehicleList();

      if (commonResponse.message.isNotEmpty) {
        homeState.vehicleModelList.value = List<VehicleModel>.from(
          commonResponse.jsonData["data"].map(
            (model) => VehicleModel.fromJson(model),
          ),
        );

        logger.log(homeState.vehicleModelList);
        logger.i("API CALL SUCCESS");
      }
      homeState.loadStatus.value = LoadStatus.success;
    } catch (e) {
      homeState.loadStatus.value = LoadStatus.failure;
      logger.e("ERROR VEHICLE API: $e");
    }
  }
}
