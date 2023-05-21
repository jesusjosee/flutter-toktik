// To parse this JSON data, do
//
//     final localVideoPost = localVideoPostFromJson(jsonString);

import 'dart:convert';

import 'package:toktik/domain/entities/video_post.dart';

class LocalVideoModel {
    final String name;
    final String videoUrl;
    final int likes;
    final int views;

    LocalVideoModel({
        required this.name,
        required this.videoUrl,
        this.likes = 0,
        this.views = 0
    });

    factory LocalVideoModel.fromRawJson(String str) => LocalVideoModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    // El factory crea un constructor con Nombre que retorna una instancia de LocalVideoModel a partir de un mapa o diccionario
    factory LocalVideoModel.fromJson(Map<String, dynamic> json) => LocalVideoModel(
        name: json["name"] ?? 'No name',
        videoUrl: json["videoUrl"],
        likes: json["likes"] ?? 0,
        views: json["views"] ?? 0,
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "videoUrl": videoUrl,
        "likes": likes,
        "views": views,
    };

    // Funcion que retorna un VideoPost a partir de las instancias de esta clase
    VideoPost toPostEntity() => VideoPost(
      caption: name, 
      videoUrl: videoUrl,
      likes: likes,
      views: views
    );
}
