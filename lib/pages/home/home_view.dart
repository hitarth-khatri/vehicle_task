import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vehicle_task/common/constants/color_constants.dart';
import 'package:vehicle_task/common/constants/string_constants.dart';
import 'package:vehicle_task/common/enums/loading_status.dart';
import 'package:vehicle_task/common/widgets/common_widgets.dart';
import 'package:vehicle_task/models/vehicle_model.dart';
import 'package:vehicle_task/pages/home/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CommonWidgets.commonText(
          text: StringConstants.vehicleData,
        ),
      ),
      body: Obx(
        () => controller.homeState.loadStatus.value == LoadStatus.loading
            ? _shimmerList()
            : controller.homeState.vehicleModelList.isEmpty
                ? Center(
                    child: CommonWidgets.commonText(
                      text: StringConstants.noDataFound,
                    ),
                  )
                : RefreshIndicator(
                    onRefresh: () async {
                      await controller.getVehicleList();
                    },
                    child: ListView.separated(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: controller.homeState.vehicleModelList.length,
                      itemBuilder: (context, index) {
                        String companyName = controller
                            .homeState.vehicleModelList[index].company;
                        String modelName =
                            controller.homeState.vehicleModelList[index].model;
                        String makeYear = controller
                            .homeState.vehicleModelList[index].makeYear;
                        String mileage = controller
                            .homeState.vehicleModelList[index].mileage;

                        return ListTile(
                          leading: CircleAvatar(
                            radius: 24,
                            child: CommonWidgets.commonText(
                              text: makeYear,
                            ),
                          ),
                          title: CommonWidgets.commonText(
                            text: modelName,
                          ),
                          subtitle: CommonWidgets.commonText(
                            text: companyName,
                          ),
                          trailing: CommonWidgets.commonText(
                            text: mileage,
                          ),
                          tileColor: _getTileColor(
                              controller.homeState.vehicleModelList[index]),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                    ),
                  ),
      ),
    );
  }

  /// get tile color [green - less pollutant, amber - average pollutant, red - more pollutant]
  Color? _getTileColor(VehicleModel vehicleModel) {
    // vehicleModel.mileage in form of "number km/liter split into list using character space"

    if ((int.parse(vehicleModel.makeYear) >=
            controller.homeState.dateTime.year - 5) &&
        (int.parse(vehicleModel.mileage.split(" ")[0]) >= 15)) {
      return ColorConstants.greenColor;
    } else if ((int.parse(vehicleModel.makeYear) <
            controller.homeState.dateTime.year - 5) &&
        (int.parse(vehicleModel.mileage.split(" ")[0]) >= 15)) {
      return ColorConstants.amberColor;
    } else {
      return ColorConstants.redColor;
    }
  }

  /// shimmer for loading
  Widget _shimmerList() {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 4,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) => Shimmer.fromColors(
        baseColor: Colors.grey.shade400,
        highlightColor: Colors.grey.shade50,
        loop: 15,
        child: ListTile(
          leading: const CircleAvatar(
            radius: 24,
            child: SizedBox(
              height: 8,
              width: 50,
            ),
          ),
          title: Container(
            height: 8,
            width: 100,
            color: Colors.white,
          ),
          subtitle: Container(
            height: 8,
            width: 100,
            color: Colors.white,
          ),
          trailing: Container(
            height: 8,
            width: 32,
            color: Colors.white,
          ),
          tileColor: ColorConstants.greyBackground,
        ),
      ),
    );
  }
}
