import 'package:eclipse/features/user_selection/data/repository/users_repository.dart';
import 'package:eclipse/features/user_selection/domain/entities/user_model.dart';

class SelectionUseCase {
  SelectionUseCase({required this.selectionRepository});
  final Repository selectionRepository;

  Future<List<UserModel?>> call() async {
    return await selectionRepository.usersList();
  }
}
