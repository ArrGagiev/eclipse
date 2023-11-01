part of 'information_bloc.dart';

abstract class InformationState {}

class InitialInformation extends InformationState {}

// При успешной загрузке фоток
class SuccesfulUploadingState extends InformationState {
  SuccesfulUploadingState({required this.photos});
  List<PhotoModel?> photos;
}

// При неудачной загрузке списка | Ошибка
class FailureUploadingState extends InformationState {
  FailureUploadingState({required this.exception});
  Object? exception;
}

// Состояние загрузки карточки
class LoadingIndicatorState extends InformationState {}
