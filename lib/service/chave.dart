
import 'package:http/http.dart' as http; // Para requisições HTTP
import 'dart:convert'; // Para manipulação de JSON

const String youTubeApiKey = "AIzaSyDSmHi6iuWqdQ5KYpKt6shEibgQ0bJrQBM"; // Substitua pela sua chave válida
const String baseUrl = "https://www.googleapis.com/youtube/v3/";

class Api {
  Future<List<dynamic>> pesquisar(String termoPesquisa) async {
    final Uri url = Uri.parse(
      "$baseUrl"
      "search?part=snippet&type=video&maxResults=20&order=date&key=$youTubeApiKey&q=$termoPesquisa",
    );

    try {
      final http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return data['items'] as List<dynamic>;
      } else {
        throw Exception('Erro na API do YouTube: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro ao buscar vídeos: $e');
      return [];
    }
  }
}
/*
class Video {
  final String titulo;
  final String canal;
  final String image;

  Video({required this.titulo, required this.canal, required this.image});

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      titulo: json['snippet']['title'],
      canal: json['snippet']['channelTitle'],
      image: json['snippet']['thumbnails']['high']['url'],
    );
  }
}*/