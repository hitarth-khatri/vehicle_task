// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleModel _$VehicleModelFromJson(Map<String, dynamic> json) => VehicleModel(
      id: json['id'] as int? ?? 0,
      company: json['company'] as String? ?? '',
      model: json['model'] as String? ?? '',
      makeYear: json['make_year'] as String? ?? '',
      mileage: json['mileage'] as String? ?? '',
    );

Map<String, dynamic> _$VehicleModelToJson(VehicleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'company': instance.company,
      'model': instance.model,
      'make_year': instance.makeYear,
      'mileage': instance.mileage,
    };
