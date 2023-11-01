part of 'selection_bloc.dart';

abstract class SelectionEvent {}

// Загрузка списка пользователей
class GetUsersEvent extends SelectionEvent {}

// Сдедующий пользователь
class ShowNextUserEvent extends SelectionEvent {}

// Предыдущий пользователь
class ShowPreviousserEvent extends SelectionEvent {}
