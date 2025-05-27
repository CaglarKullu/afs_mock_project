import 'package:freezed_annotation/freezed_annotation.dart';
part 'items_model.freezed.dart';
part 'items_model.g.dart';

@Freezed(toJson: true)
abstract class ItemModel with _$ItemModel {
  const factory ItemModel({
    required int id,
    required String name,
    required String description,
  }) = _ItemModel;

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);
}
