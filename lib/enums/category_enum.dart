import 'package:freezed_annotation/freezed_annotation.dart';

enum CategoryEnum {
  @JsonValue('Places')
  places,
  @JsonValue('Picks')
  picks,
  @JsonValue('Rivers And Canals')
  riversAndCanals,
  @JsonValue('Lake')
  lake,
  @JsonValue('National Parks')
  nationalParks,
  @JsonValue('Cities')
  cities,
}