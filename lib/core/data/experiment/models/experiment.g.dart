// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experiment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExperimentImpl _$$ExperimentImplFromJson(Map<String, dynamic> json) =>
    _$ExperimentImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      shortCode: json['shortCode'] as String,
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
      description: json['description'] as String?,
      activityTypeOverride: $enumDecodeNullable(
          _$SensorActivityTypeEnumMap, json['activityTypeOverride']),
      smartphonePositionOverride: $enumDecodeNullable(
          _$SmartphonePositionEnumMap, json['smartphonePositionOverride']),
      duration: (json['duration'] as num?)?.toInt(),
      enabled: json['enabled'] as bool? ?? false,
    );

Map<String, dynamic> _$$ExperimentImplToJson(_$ExperimentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'shortCode': instance.shortCode,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'description': instance.description,
      'activityTypeOverride':
          _$SensorActivityTypeEnumMap[instance.activityTypeOverride],
      'smartphonePositionOverride':
          _$SmartphonePositionEnumMap[instance.smartphonePositionOverride],
      'duration': instance.duration,
      'enabled': instance.enabled,
    };

const _$SensorActivityTypeEnumMap = {
  SensorActivityType.armRotation: 'armRotation',
  SensorActivityType.clapHands: 'clapHands',
  SensorActivityType.onBicycle: 'onBicycle',
  SensorActivityType.inVehicle: 'inVehicle',
  SensorActivityType.stand: 'stand',
  SensorActivityType.sit: 'sit',
  SensorActivityType.talkSit: 'talkSit',
  SensorActivityType.standSit: 'standSit',
  SensorActivityType.lay: 'lay',
  SensorActivityType.jump: 'jump',
  SensorActivityType.walk: 'walk',
  SensorActivityType.walkOnSpot: 'walkOnSpot',
  SensorActivityType.walkingBack: 'walkingBack',
  SensorActivityType.walkingCircle: 'walkingCircle',
  SensorActivityType.tapisRoulant: 'tapisRoulant',
  SensorActivityType.horizontalCyclette: 'horizontalCyclette',
  SensorActivityType.verticalCyclette: 'verticalCyclette',
  SensorActivityType.run: 'run',
  SensorActivityType.runOnSpot: 'runOnSpot',
};

const _$SmartphonePositionEnumMap = {
  SmartphonePosition.byHand: 'byHand',
  SmartphonePosition.byHandPortrait: 'byHandPortrait',
  SmartphonePosition.pocket: 'pocket',
  SmartphonePosition.pouch: 'pouch',
  SmartphonePosition.handleBar: 'handleBar',
};
