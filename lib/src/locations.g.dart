// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LatLng _$LatLngFromJson(Map<String, dynamic> json) {
  return LatLng(
    lat: (json['lat'] as num)?.toDouble(),
    lng: (json['lng'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$LatLngToJson(LatLng instance) => <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

Destination _$DestinationFromJson(Map<String, dynamic> json) {
  return Destination(
    location: json['location'] == null
        ? null
        : LatLng.fromJson(json['location'] as Map<String, dynamic>),
    id: json['id'] as String,
    city: json['city'] as String,
    region: json['region'] as String,
  );
}

Map<String, dynamic> _$DestinationToJson(Destination instance) =>
    <String, dynamic>{
      'location': instance.location,
      'id': instance.id,
      'city': instance.city,
      'region': instance.region,
    };

Locations _$LocationsFromJson(Map<String, dynamic> json) {
  return Locations(
    destinations: (json['destinations'] as List)
        ?.map((e) =>
            e == null ? null : Destination.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$LocationsToJson(Locations instance) => <String, dynamic>{
      'destinations': instance.destinations,
    };
