import 'package:equatable/equatable.dart';

class LoginLast extends Equatable {
  final String? id;
  final String? name;

  const LoginLast({
    this.id,
    this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
