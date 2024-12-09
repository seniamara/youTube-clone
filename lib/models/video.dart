class Video {
  final String id;
  final String titulo;
  final String imagem;
  final String descricao;
  final String canal;

  Video({
    required this.id,
    required this.titulo,
    required this.imagem,
    required this.descricao,
    required this.canal,
  });

  // Método "fromJson" para converter o JSON em um objeto da classe
  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json['id']['videoId'] ?? '',
      titulo: json['snippet']['title'] ?? '', 
      imagem: json['snippet']['thumbnails']['high']['url'] ?? '',
      descricao: json['snippet']['description'] ?? '',
      canal: json['snippet']['channelTitle'] ?? '',
    );
  }
}
