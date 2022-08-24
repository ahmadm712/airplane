import 'package:airplane/features/list_news/domain/entities/sources.dart';
import 'package:equatable/equatable.dart';

class SourceModel extends Equatable {
  SourceModel({
    this.id,
    this.name,
  });

  dynamic? id;
  String? name;

  factory SourceModel.fromJson(Map<String, dynamic> json) => SourceModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  Source toEntity() {
    return Source(id: id, name: name);
  }

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
