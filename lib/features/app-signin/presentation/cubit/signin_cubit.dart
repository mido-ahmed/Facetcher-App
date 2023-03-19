// ignore_for_file: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/models/response_model.dart';
import '../../../../data/entities/authentication/signin.dart';
import '../../../../data/entities/authentication/signin_claims.dart';
import '../../domain/entities/signin_request.dart';
import '../../domain/usecases/signin_usecase.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  final SigninUseCase signinUseCase;

  SigninCubit({required this.signinUseCase}) : super(SigninInitial());

  Future<void> signin(SigninRequest signinRequest) async {
    emit(SigninInitial());
    emit(SigninLoading());
    Either<GenericException, ResponseModel<SigninClaims>> response =
        await signinUseCase(Signin(
            email: signinRequest.email,
            password: signinRequest.password,
            rememberme: signinRequest.rememberme));
    emit(response.fold(
        (exception) => SigninError(message: exception.message),
        (signinClaimsResponse) => SigninSuccess(
            signinClaims: signinClaimsResponse.body,
            signinClaimsResponse: signinClaimsResponse)));
  }
}
