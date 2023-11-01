import 'package:eclipse/features/user_selection/data/dto/photo_dto.dart';
import 'package:eclipse/features/user_selection/domain/entities/photo_model.dart';

extension PhotoDtoToDomain on PhotoDto {
  PhotoModel toDomain() {
    return PhotoModel(
      albumId: albumId,
      id: id,
      title: title,
      url: url,
      thumbnailUrl: thumbnailUrl,
    );
  }
}
