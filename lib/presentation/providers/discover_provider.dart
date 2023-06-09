import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/infrastructure/local_video_model.dart';

import 'package:toktik/shared/data/local_video_post.dart';

class DiscoverProvider extends ChangeNotifier{

  // TODO: Repository, DataSource

  bool initialLoading = true;
  List<VideoPost> videos = [];

  // Este metodo carga los videos
  Future<void> loadNextPage() async{

    // ESto solo simula el retardo de una peticion
    // await Future.delayed(const Duration(seconds: 2));

    // Se retorna una lista de VideoPost a partir de un listado en crudo que esta en un archivo, se itera sobre esa lista
    // y se retorna una instancia de LocalVideoModel se le pasa un mapa al fromJson y luego se retorna una instancia de VideoPost
    // y luego el resultaso se debe convertir a lista ya que el map retorna un iterable no una lista.
    final List<VideoPost> newVideos = videoPosts.map(
      (video) => LocalVideoModel.fromJson(video).toPostEntity()
    ).toList();

    videos.addAll(newVideos);
    initialLoading = false;

    notifyListeners();
  }

}