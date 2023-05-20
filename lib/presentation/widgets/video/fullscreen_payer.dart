import 'package:flutter/material.dart';
import 'package:toktik/presentation/widgets/video/video_backgorund.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {
  final String videoUrl;
  final String caption;

  const FullScreenPlayer({
    super.key, 
    required this.videoUrl, 
    required this.caption
  });

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {

  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    // se accede con el metodo widget a las propiedades del stafulWidget

    // obtiene el video de la url en ese caso de los assets y pone el volumen a 0 ,reproduccion infinita, y le da play.
    controller = VideoPlayerController.asset( widget.videoUrl )
      ..setVolume(0.3) // volumen
      ..setLooping(true)
      ..play();

  }

  @override
  void dispose() {
    //terminar el video, es cesario hacerlo
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initialize(),
      builder: (context, snapshot) {

        if ( snapshot.connectionState != ConnectionState.done){
          return const Center(child: CircularProgressIndicator(strokeWidth: 2,),);
        }

        return GestureDetector(
          onTap: () {

            // play the video
             if (controller.value.isPlaying) {
              controller.pause();
              return;
            }
            // If the video is paused, play it.
            controller.play();
            
          },
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            // Use the VideoPlayer widget to display the video.
            child: Stack(
              children: [
                // video del url
                VideoPlayer(controller),
        
                // Gradiente
                VideoBackground(stops: const [0.8, 1.0],),
        
                // Texto
                Positioned(
                  bottom: 50,
                  left: 20,
                  child: _VideoCaption(caption: widget.caption,)
                )
        
              ]
            ),
          ),
        );
        
      },
    );
  }
}

class _VideoCaption extends StatelessWidget {

  final String caption;
  const _VideoCaption({required this.caption});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return SizedBox(
      width: size.width * 0.6,
      child: Text(caption, maxLines: 2, style: titleStyle,),
    );
  }
}