part of 'login_tablet_bloc.dart';

sealed class LoginTabletEvent extends Equatable {
  const LoginTabletEvent();

  @override
  List<Object> get props => [];
}

final class LoginTabletPressed extends LoginTabletEvent {
  final LoginTabletRequestModel request;

  const LoginTabletPressed({required this.request});
}
