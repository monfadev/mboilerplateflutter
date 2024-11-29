import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:mboilerplateflutter/data/models/authentication/login_tablet_request_model.dart';
import 'package:mboilerplateflutter/domain/entities/authentication/login_tablet.dart';
import 'package:mboilerplateflutter/domain/usecases/authentication/post_login_tablet_use_case.dart';

part 'login_tablet_event.dart';
part 'login_tablet_state.dart';

class LoginTabletBloc extends Bloc<LoginTabletEvent, LoginTabletState> {
  final PostLoginTabletUseCase postLoginTabletUseCase;
  CancelToken? cancelToken;

  LoginTabletBloc({
    required this.postLoginTabletUseCase,
    required this.cancelToken,
  }) : super(LoginTabletInitial()) {
    on<LoginTabletPressed>(_onLoginTabletPressed);
  }

  Future<void> _onLoginTabletPressed(
    LoginTabletPressed event,
    Emitter<LoginTabletState> emit,
  ) async {
    initCancelToken();

    emit(LoginTabletLoading());

    final result = await postLoginTabletUseCase.execute(event.request);
    await result.fold(
      (failure) {
        emit(LoginTabletFailure(failure.message));
      },
      (data) async {
        emit(LoginTabletSuccess(result: data));
      },
    );
  }

  void cancelRequest() {
    cancelToken?.cancel('Request canceled on login tablet bloc');
  }

  void initCancelToken() {
    cancelToken = CancelToken();
  }
}
