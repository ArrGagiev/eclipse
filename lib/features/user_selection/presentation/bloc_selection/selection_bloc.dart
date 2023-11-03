import 'package:eclipse/features/user_selection/data/repository/users_repository.dart';
import 'package:eclipse/features/user_selection/domain/entities/photo_model.dart';
import 'package:eclipse/features/user_selection/domain/entities/user_model.dart';
import 'package:eclipse/features/user_selection/domain/usecases/info_usecase.dart';
import 'package:eclipse/features/user_selection/domain/usecases/selection_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'selection_event.dart';
part 'selection_state.dart';

class SelectionBloc extends Bloc<SelectionEvent, SelectionState> {
  List<UserModel?> _users = [];
  List<PhotoModel?> _photos = [];
  int _currentUserIndex = 0;

  SelectionBloc() : super(InitialState()) {
    on<GetUsersEvent>(_uploadingUsersData);
    on<ShowNextUserEvent>(_showNextUser);
    on<ShowPreviousserEvent>(_showPreviousUser);
  }

  Future _uploadingUsersData(
      GetUsersEvent event, Emitter<SelectionState> emit) async {
    emit(LoadingIndicatorState());
    // -------------------------------------------------------------------
    Repository repository = Repository();
    SelectUseCase selectionUseCase = SelectUseCase(repository: repository);
    InfoUseCase infoUseCase = InfoUseCase(repository: repository);
    // -------------------------------------------------------------------
    try {
      List<UserModel?> users = await selectionUseCase.call();
      _users = users;

      List<PhotoModel?> photos = await infoUseCase.call();
      _photos = photos;

      emit(SuccesfulUploadingState(
        users: users,
        photos: photos,
        userIndex: _currentUserIndex,
      ));
    } catch (error) {
      debugPrint(error.toString());
      emit(FailureUploadingState(exception: error.toString()));
    }
  }

  _showNextUser(ShowNextUserEvent event, Emitter<SelectionState> emit) {
    if (_currentUserIndex == _users.length - 1) {
      _currentUserIndex = 0;
    } else {
      _currentUserIndex++;
    }
    emit(SuccesfulUploadingState(
      users: _users,
      photos: _photos,
      userIndex: _currentUserIndex,
    ));
  }

  _showPreviousUser(ShowPreviousserEvent event, Emitter<SelectionState> emit) {
    if (_currentUserIndex == 0) {
      _currentUserIndex = _users.length - 1;
    } else {
      _currentUserIndex--;
    }
    emit(SuccesfulUploadingState(
      users: _users,
      photos: _photos,
      userIndex: _currentUserIndex,
    ));
  }
}
