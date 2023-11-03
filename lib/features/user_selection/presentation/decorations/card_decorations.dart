import 'package:eclipse/features/user_selection/domain/entities/photo_model.dart';
import 'package:eclipse/features/user_selection/domain/entities/user_model.dart';
import 'package:flutter/material.dart';

Decoration cardDecoration({
  required UserModel? user,
  required List<PhotoModel?> photos,
}) {
  List<PhotoModel?> filteredPhotos =
      photos.where((e) => e!.albumId == user?.id).toList();

  return BoxDecoration(
    image: DecorationImage(
      fit: BoxFit.cover,
      image: NetworkImage(filteredPhotos.first!.url.toString()),
    ),
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
  );
}
