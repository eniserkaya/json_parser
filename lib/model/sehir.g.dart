// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sehir.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sehir _$SehirFromJson(Map<String, dynamic> json) {
  return Sehir(json['sehirAdi'] as String, json['plakaKodu'] as int);
}

Map<String, dynamic> _$SehirToJson(Sehir instance) => <String, dynamic>{
      'sehirAdi': instance.sehirAdi,
      'plakaKodu': instance.plakaKodu
    };
