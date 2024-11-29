part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final LoginTabletResponseModel loginModel;

  const AuthState({
    required this.loginModel,
  });

  factory AuthState.initial() {
    return const AuthState(
      loginModel: LoginTabletResponseModel(),
    );
  }

  factory AuthState.fromJson(Map<String, dynamic> json) {
    return AuthState(
      loginModel: LoginTabletResponseModel.fromMap(json['loginModel']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'loginModel': loginModel.toMap(),
    };
  }

  @override
  List<Object?> get props => [loginModel];
}
