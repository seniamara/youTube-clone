import 'package:flutter/material.dart';
import 'package:provider/models/video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../service/chave.dart';

class Inicio extends StatefulWidget {
  final String pesquisa;
  Inicio(this.pesquisa);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  Future<List<Video>> _listaDeVideo(String search) async {
    Api api = Api();
    final resultados = await api.pesquisar(search);
    return resultados.map((item) => Video.fromJson(item)).toList();
  }

  void _playVideo(String videoId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoPlayerScreen(videoId: videoId),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
      future: _listaDeVideo(widget.pesquisa),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.done:
            if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  final video = snapshot.data![index];
                  return GestureDetector(
                    onTap: () => _playVideo(video.id),
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(video.imagem),
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text(video.canal),
                          subtitle: Text(video.titulo),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    Divider(height: 2, color: Colors.grey),
                itemCount: snapshot.data!.length,
              );
            } else {
              return Center(
                child: Text("Nenhum dado a ser exibido!"),
              );
            }
          default:
            return Center(
              child: Text("Algo deu errado!"),
            );
        }
      },
    );
  }
}

class VideoPlayerScreen extends StatelessWidget {
  final String videoId;
  const VideoPlayerScreen({required this.videoId});

  @override
  Widget build(BuildContext context) {
    final YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Player de Vídeo"),
      ),
      body: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.red,
      ),
    );
  }
}
