import 'package:eclipse/features/user_selection/presentation/bloc_selection/selection_bloc.dart';
import 'package:eclipse/common/widgets/error_alert_dialog.dart';
import 'package:eclipse/common/widgets/space_divider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'widgets/user_info_dialog.dart';
import 'widgets/loading_screen.dart';
import 'widgets/buttons.dart';
import 'widgets/user_card.dart';

class UserSelectionPage extends StatelessWidget {
  const UserSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<SelectionBloc>(
        create: (context) => SelectionBloc()..add(GetUsersEvent()),
        child: BlocConsumer<SelectionBloc, SelectionState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              body: CustomScrollView(
                physics: const NeverScrollableScrollPhysics(),
                slivers: [
                  // ---------------------------------------------------- AppBar
                  const SliverAppBar(title: Text('Eclipse')),
                  // ------------------------------------------------------ Body
                  if (state is LoadingIndicatorState)
                    const SliverToBoxAdapter(
                      child: Center(
                        child: LoadingScreen(),
                      ),
                    ),
                  if (state is SuccesfulUploadingState)
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          // ------------------------------------------ Карточка
                          UserCard(
                            user: state.users[state.userIndex],
                            photos: state.photos,
                            onTap: () {
                              infoDialog(
                                context,
                                user: state.users[state.userIndex],
                              );
                            },
                          ),
                          const SpaceDivider(height: 20),
                          // ------------------------------------- Кнопки выбора
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SelectionButton(
                                icon: Icons.arrow_back,
                                onPressed: () {
                                  context
                                      .read<SelectionBloc>()
                                      .add(ShowPreviousserEvent());
                                },
                              ),
                              SelectionButton(
                                icon: Icons.arrow_forward,
                                onPressed: () {
                                  context
                                      .read<SelectionBloc>()
                                      .add(ShowNextUserEvent());
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  if (state is FailureUploadingState)
                    SliverToBoxAdapter(
                      // ------------------------------------------- Окно ошибки
                      child: ErrorAlertDialog(
                        title: 'Выявленна ошибка:',
                        content: state.exception.toString(),
                        onPressed: () {
                          context.read<SelectionBloc>().add(GetUsersEvent());
                        },
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
