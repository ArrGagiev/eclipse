import 'package:eclipse/features/user_selection/domain/entities/user_model.dart';
import 'package:flutter/material.dart';

Decoration cardDecoration({required UserModel? user}) {
  return BoxDecoration(
    image: const DecorationImage(
      fit: BoxFit.cover,
      image: NetworkImage(
        'https://via.placeholder.com/600/771796', // TODO!!!!!!!
      ),
    ),
    color: Colors.green,
    borderRadius: BorderRadius.circular(10),
  );
}
