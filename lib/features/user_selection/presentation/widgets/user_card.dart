import 'package:eclipse/features/user_selection/domain/entities/photo_model.dart';
import 'package:eclipse/features/user_selection/domain/entities/user_model.dart';
import 'package:eclipse/features/user_selection/presentation/decorations/card_decorations.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, this.onTap, this.user, required this.photos});
  final Function? onTap;
  final UserModel? user;
  final List<PhotoModel?> photos;

  @override
  Widget build(BuildContext context) {
    // желаемая высота карточки в диапазоне от 0 до 1
    double desiredHeight = 0.6;
    return GestureDetector(
      onTap: () => onTap != null ? onTap!() : null,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            // --------------------------------------------------------- Фотка
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * desiredHeight,
              decoration: cardDecoration(
                user: user,
                photos: photos,
              ),
            ),
            // ----------------------------------------------------------- Имя
            Positioned(
              top: 10,
              child: Text(
                user?.name.toString() ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.white, fontSize: 28),
              ),
            ),
            // -------------------------------------------------------- Работа
            Positioned(
              top: 45,
              child: Text(
                user?.company?.name.toString() ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            // ------------------------------------------------------ Описание
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                user?.company?.bs.toString() ?? '',
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
