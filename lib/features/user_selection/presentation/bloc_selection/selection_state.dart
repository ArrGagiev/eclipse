part of 'selection_bloc.dart';

abstract class SelectionState {}

// Начальное состояние
class InitialState extends SelectionState {}

// При успешной загрузке пользователей
class SuccesfulUploadingState extends SelectionState {
  SuccesfulUploadingState({
    required this.users,
    required this.photos,
    required this.userIndex,
  });
  List<UserModel?> users;
  List<PhotoModel?> photos;
  int userIndex;
}

// При неудачной загрузке списка | Ошибка
class FailureUploadingState extends SelectionState {
  FailureUploadingState({required this.exception});
  Object? exception;
}

// Состояние загрузки (крутилочка)
class LoadingIndicatorState extends SelectionState {}
