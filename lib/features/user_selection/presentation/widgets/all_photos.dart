import 'package:eclipse/features/user_selection/domain/entities/photo_model.dart';
import 'package:flutter/material.dart';

class AllUserPhotos extends StatelessWidget {
  const AllUserPhotos({super.key, required this.photos, this.userId});

  final List<PhotoModel?> photos;
  final int? userId;

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = 3;
    double mainAxisSpacing = 2.5;
    double crossAxisSpacing = 2.5;
    double desiredHeight = 0.6;

    List<PhotoModel?> filteredPhotos =
        photos.where((e) => e!.albumId == userId).toList();

    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * desiredHeight,
        child: GridView.builder(
          itemCount: filteredPhotos.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: mainAxisSpacing,
            crossAxisSpacing: crossAxisSpacing,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              // color: Colors.teal[100 * (index % 9)],
              // child: Text('grid item $index'),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    filteredPhotos[index]?.thumbnailUrl.toString() ?? '',
                  ),
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            );
          },
        ),
      ),
    );
  }
}
