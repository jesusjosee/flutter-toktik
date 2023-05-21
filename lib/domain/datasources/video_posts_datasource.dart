import 'package:toktik/domain/entities/video_post.dart';

abstract class VideoPostsDatasource {
  // Aqui solo se definen los metodos , el repositorio de va encargar de implementar esos metodos
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId);

  Future<List<VideoPost>> getTrendingVideosByPage(int page);
}
