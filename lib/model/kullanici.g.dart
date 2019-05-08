// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kullanici.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Kullanici _$KullaniciFromJson(Map<String, dynamic> json) {
  return Kullanici(
      json['ad'] as String,
      json['soyad'] as String,
      (json['gezilenYerler'] as List)
          ?.map((e) =>
              e == null ? null : Sehir.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$KullaniciToJson(Kullanici instance) => <String, dynamic>{
      'ad': instance.ad,
      'soyad': instance.soyad,
      'gezilenYerler': instance.gezilenYerler
    };
