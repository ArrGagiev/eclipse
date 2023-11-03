import 'package:eclipse/features/user_selection/data/repository/users_repository.dart';
import 'package:eclipse/features/user_selection/domain/entities/photo_model.dart';

class InfoUseCase {
  InfoUseCase({required this.repository});
  final Repository repository;

  Future<List<PhotoModel?>> call() async {
    return await repository.photosList();
  }
}
