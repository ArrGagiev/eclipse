import 'package:eclipse/features/user_selection/domain/entities/user_model.dart';
import 'package:eclipse/features/user_selection/presentation/bloc_information/information_bloc.dart';
import 'package:eclipse/features/user_selection/presentation/widgets/buttons.dart';
import 'package:eclipse/features/user_selection/presentation/widgets/description_card.dart';
import 'package:eclipse/features/user_selection/presentation/widgets/all_photos.dart';
import 'package:eclipse/common/widgets/space_divider.dart';
import 'package:eclipse/features/user_selection/presentation/widgets/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future infoDialog(BuildContext context, {required UserModel? user}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: BlocProvider(
              create: (context) =>
                  InformationBloc()..add(OpenDialogEvent(userId: 0)),
              child: BlocBuilder<InformationBloc, InformationState>(
                builder: (context, state) {
                  if (state is LoadingIndicatorState) {
                    return const LoadingScreen();
                  }
                  if (state is SuccesfulUploadingState) {
                    return AlertDialog(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                      actionsAlignment: MainAxisAlignment.center,
                      title: Text(user?.name.toString() ?? ''),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // ----------------------------- Все фото пользователя
                          AllUserPhotos(
                            photos: state.photos,
                            userId: user?.id ?? -1,
                          ),
                          const SpaceDivider(height: 20),
                          // ----------------------------- Карточка пользователя
                          DescriptionCard(user: user),
                        ],
                      ),
                      actions: [
                        SimpleButton(
                          text: 'Ok',
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    );
                  }
                  if (state is FailureUploadingState) {
                    return AlertDialog(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                      actionsAlignment: MainAxisAlignment.center,
                      title: const Text('Ошибка'),
                      content: const Text('Попробуйте загрузить еще раз'),
                      actions: [
                        SimpleButton(
                          text: 'Ok',
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          )
        ],
      );
    },
  );
}
