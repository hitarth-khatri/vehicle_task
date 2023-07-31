import 'package:get/get.dart';

import '../api_service/api_constant.dart';
import '../api_service/dio_client.dart';
import '../common/enums/method_type.dart';
import '../models/common_response.dart';

abstract class AuthRepository {
  Future<CommonResponse> getVehicleList();
}

class AuthRepositoryImpl extends AuthRepository {
  late DioClient _dioClient;

  AuthRepositoryImpl() {
    _dioClient = Get.find();
  }

  @override
  Future<CommonResponse> getVehicleList() async {
    try {
      var response = await _dioClient.request(
        ApiConstant.cars,
        MethodType.get,
        {},
      );

      return CommonResponse.fromJson(response, (json) => response);
    } catch (e) {
      rethrow;
    }
  }
}
