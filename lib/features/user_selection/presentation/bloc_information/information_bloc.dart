import 'package:eclipse/features/user_selection/data/repository/users_repository.dart';
import 'package:eclipse/features/user_selection/domain/usecases/info_usecase.dart';
import 'package:eclipse/features/user_selection/domain/entities/photo_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'information_event.dart';
part 'information_state.dart';

class InformationBloc extends Bloc<InformationEvent, InformationState> {
  InformationBloc() : super(InitialInformation()) {
    on<OpenDialogEvent>(_openDialogEvent);
  }

  Future _openDialogEvent(
      OpenDialogEvent event, Emitter<InformationState> emit) async {
    emit(LoadingIndicatorState());
    // -------------------------------------------------------------------
    Repository repository = Repository();
    InfoUseCase infoUseCase = InfoUseCase(repository: repository);
    // -------------------------------------------------------------------
    try {
      List<PhotoModel?> photos = await infoUseCase.call();
      emit(SuccesfulUploadingState(photos: photos));
    } catch (error) {
      debugPrint(error.toString());
      emit(FailureUploadingState(exception: error.toString()));
    }
  }
}
