import 'package:eclipse/features/user_selection/data/repository/users_repository.dart';
import 'package:eclipse/features/user_selection/domain/entities/user_model.dart';

class SelectUseCase {
  SelectUseCase({required this.repository});
  final Repository repository;

  Future<List<UserModel?>> call() async {
    return await repository.usersList();
  }
}
