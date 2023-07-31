import 'package:json_annotation/json_annotation.dart';

part 'vehicle_model.g.dart';

@JsonSerializable()
class VehicleModel {
  @JsonKey(name: "id", defaultValue: 0)
  int id;

  @JsonKey(name: "company", defaultValue: "")
  String company;

  @JsonKey(name: "model", defaultValue: "")
  String model;

  @JsonKey(name: "make_year", defaultValue: "")
  String makeYear;

  @JsonKey(name: "mileage", defaultValue: "")
  String mileage;

  VehicleModel({
    this.id = 0,
    this.company = "",
    this.model = "",
    this.makeYear = "",
    this.mileage = "",
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) =>
      _$VehicleModelFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleModelToJson(this);
}
