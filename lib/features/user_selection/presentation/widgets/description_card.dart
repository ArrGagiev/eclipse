import 'package:eclipse/common/widgets/space_divider.dart';
import 'package:eclipse/features/user_selection/domain/entities/user_model.dart';
import 'package:flutter/material.dart';

class DescriptionCard extends StatelessWidget {
  const DescriptionCard({super.key, this.user});
  final UserModel? user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ---------------------------------------------------- Имя
          Text(
            user?.name.toString() ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 28),
          ),
          const SpaceDivider(height: 20),
          // ------------------------------------------------- Работа
          Text(
            user?.company?.name.toString() ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 20),
          ),
          const SpaceDivider(height: 20),
          // ----------------------------------------------- Описание
          Text(
            user?.company?.catchPhrase.toString() ?? '',
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
