part of 'information_bloc.dart';

abstract class InformationEvent {}

class OpenDialogEvent extends InformationEvent {
  OpenDialogEvent({required this.userId});
  int userId;
}
