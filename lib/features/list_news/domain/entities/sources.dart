import 'package:equatable/equatable.dart';

class Source extends Equatable {
  Source({
    this.id,
    this.name,
  });

  dynamic? id;
  String? name;

  @override
  List<Object?> get props => [id, name];
}
