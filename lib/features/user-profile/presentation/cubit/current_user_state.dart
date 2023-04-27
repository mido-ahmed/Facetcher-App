import 'package:equatable/equatable.dart';

import '../../../../data/models/user/user.dart';

abstract class CurrentUserState extends Equatable {
  const CurrentUserState();

  @override
  List<Object> get props => [];
}

class CurrentUserInitial extends CurrentUserState {}

class CurrentUserLoading extends CurrentUserState {}

class CurrentUserSuccess extends CurrentUserState {
  final User user;

  const CurrentUserSuccess({required this.user});

  @override
  List<Object> get props => [user];
}

class CurrentUserError extends CurrentUserState {
  final String message;

  const CurrentUserError({required this.message});

  @override
  List<Object> get props => [message];
}
