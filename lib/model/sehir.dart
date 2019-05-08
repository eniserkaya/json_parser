import 'package:json_annotation/json_annotation.dart';

part 'sehir.g.dart';

@JsonSerializable()
class Sehir extends Object {
  String sehirAdi;
  int plakaKodu;

  Sehir(this.sehirAdi, this.plakaKodu);

  factory Sehir.fromJson(Map<String, dynamic> json) => _$SehirFromJson(json);
}
