import 'package:eclipse/features/user_selection/data/dto/photo_dto.dart';
import 'package:eclipse/features/user_selection/data/mapper/photo_dto_mapper.dart';
import 'package:eclipse/features/user_selection/data/mapper/user_dto_mapper.dart';
import 'package:eclipse/features/user_selection/domain/entities/photo_model.dart';
import 'package:eclipse/features/user_selection/domain/entities/user_model.dart';
import 'package:eclipse/features/user_selection/data/dto/user_dto.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Repository {
  Future<List<UserModel?>> usersList() async {
    try {
      var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        // получили дто
        List<UserDto> dto = userFromJson(response.body);
        // размапили в модель
        List<UserModel> usersListModel = dto.map((e) => e.toDomain()).toList();
        // вернули список
        return usersListModel;
      } else {
        return throw Exception(response.statusCode.toString());
      }
    } catch (error) {
      debugPrint(error.toString());
      throw Exception(error.toString());
    }
  }

  Future<List<PhotoModel?>> photosList() async {
    try {
      var url = Uri.parse('https://jsonplaceholder.typicode.com/photos');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        // получили дто
        List<PhotoDto> dto = photoFromJson(response.body);
        // размапили в модель
        List<PhotoModel> photosListModel =
            dto.map((e) => e.toDomain()).toList();
        // вернули список
        return photosListModel;
      } else {
        return throw Exception(response.statusCode.toString());
      }
    } catch (error) {
      debugPrint(error.toString());
      throw Exception(error.toString());
    }
  }
}
