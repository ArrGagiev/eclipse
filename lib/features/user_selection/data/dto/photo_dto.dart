import 'dart:convert';

List<PhotoDto> photoFromJson(String str) =>
    List<PhotoDto>.from(json.decode(str).map((x) => PhotoDto.fromJson(x)));

String photoToJson(List<PhotoDto> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PhotoDto {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  PhotoDto({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  factory PhotoDto.fromJson(Map<String, dynamic> json) => PhotoDto(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}
