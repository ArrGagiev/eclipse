import 'package:eclipse/common/widgets/custom_text.dart';
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
          CustomText(
            text: user?.name.toString() ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            fontSize: 28,
          ),
          const SpaceDivider(height: 20),
          // ------------------------------------------------- Работа
          CustomText(
            text: user?.company?.name.toString() ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            fontSize: 20,
          ),
          const SpaceDivider(height: 20),
          // ----------------------------------------------- Описание
          CustomText(
            text: user?.company?.catchPhrase.toString() ?? '',
            fontSize: 16,
          ),
        ],
      ),
    );
  }
}
