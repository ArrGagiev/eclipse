import 'package:eclipse/features/user_selection/data/dto/user_dto.dart';
import 'package:eclipse/features/user_selection/domain/entities/user_model.dart';

extension UserDtoToDomain on UserDto {
  UserModel toDomain() {
    return UserModel(
      id: id,
      name: name,
      username: username,
      email: email,
      address: address,
      phone: phone,
      website: website,
      company: company,
    );
  }
}
