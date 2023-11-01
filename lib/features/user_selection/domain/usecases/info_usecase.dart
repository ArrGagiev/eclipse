import 'package:eclipse/features/user_selection/data/repository/users_repository.dart';
import 'package:eclipse/features/user_selection/domain/entities/photo_model.dart';

class InfoUseCase {
  InfoUseCase({required this.infoRepository});
  final Repository infoRepository;

  Future<List<PhotoModel?>> call() async {
    return await infoRepository.photosList();
  }
}
