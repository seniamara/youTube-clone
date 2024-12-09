import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          if (query.isNotEmpty) {
            query = ""; // Apenas redefine se não for vazio
            showSuggestions(context); // Atualiza a interface
          }
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, ""); // Fecha o SearchDelegate
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Fecha o delegate e retorna o termo pesquisado
    WidgetsBinding.instance.addPostFrameCallback((_) {
      close(context, query); // Evita o erro de `setState`
    });
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Exemplo com sugestões baseadas no texto digitado
    List<String> suggestions = [
      "Android",
      "iOS",
      "Flutter",
      "Dart",
      "Firebase",
    ].where((item) => item.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion; // Atualiza o texto
            showResults(context); // Mostra os resultados
          },
        );
      },
    );
  }
}
