

# 🎥 YouTube App Clone

Este projeto é um aplicativo Flutter inspirado no YouTube, com 
funcionalidades de pesquisa, reprodução de vídeos e navegação 
entre diferentes categorias. Ele utiliza a API do YouTube para 
buscar e exibir vídeos em tempo real.

---

## 🚀 **Funcionalidades**

- **Integração com a API do YouTube**:
  - Consumo dinâmico da API para buscar vídeos relacionados a um 
termo.
  - Exibição de resultados com informações do canal, título e 
imagem do vídeo.

- **Navegação Intuitiva**:
  - Barra de navegação inferior para alternar entre as telas:
    - `Início`
    - `Em Alta`
    - `Inscrições`
    - `Biblioteca`

- **Reprodução de Vídeos**:
  - Player embutido usando o plugin `youtube_player_flutter`.

- **Barra de Pesquisa Personalizada**:
  - Pesquisa com sugestões dinâmicas e integração com a API do 
YouTube.

---

## 🛠️ **Tecnologias Utilizadas**

- **Flutter**: Framework principal para desenvolvimento mobile.
- **Dart**: Linguagem de programação utilizada.
- **YouTube Data API**: Para obtenção de informações sobre vídeos.
- **Provider**: Gerenciamento de estado do app.
- **Youtube Player Flutter**: Plugin para reprodução de vídeos.

---

## 🗂️ **Estrutura do Projeto**


lib/
├── app/
│   ├── home/
│   │   ├── home.dart            # Tela principal com barra de 
navegação
│   │   ├── navbar/
│   │   │   ├── inicio.dart      # Tela inicial com vídeos buscados
│   │   │   ├── emalta.dart      # Tela "Em Alta" (a ser 
configurada)
│   │   │   ├── subscricoes.dart # Tela "Inscrições" (a ser 
configurada)
│   │   │   ├── biblioteca.dart  # Tela "Biblioteca" (a ser 
configurada)
├── models/
│   ├── video.dart               # Modelo de dados para os vídeos
├── service/
│   ├── chave.dart               # Classe para consumo da API do 
YouTube
├── widget/
│   ├── custom_delegate.dart     # Delegate personalizado para 
barra de pesquisa


---

## 🔧 **Configuração e Execução**

### Pré-requisitos:
- Flutter SDK instalado.
- Uma chave válida da **YouTube Data API** inserida no arquivo 
`service/chave.dart`.

### Passos:
1. Clone este repositório.
2. Execute `flutter pub get` para instalar as dependências.
3. Substitua a constante `youTubeApiKey` no arquivo `service/chave.
dart` pela sua chave da API do YouTube.
4. Inicie o app com `flutter run`.

---

## 🌟 **Funcionalidades Futuras**

- Configuração completa das telas "Em Alta", "Inscrições" e 
"Biblioteca".
- Melhorias no design da interface do usuário.
- Implementação de sistema de autenticação para personalização de 
conteúdo.

---


## 📄 **Licença**

Este projeto é de código aberto e está sob a licença MIT. Consulte 
o arquivo `LICENSE` para obter mais informações.

---

## 📫 Conecte-se Comigo

- 🌐 **[Meu LinkedIn](https://www.linkedin.com/in/seniamara-benedito-04630731b?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app))**
- 📧 **Email**: seniamaraa@email.com
- 📂 **Portfólio no GitHub**: [Meus 
Projetos](https://github.com/seniamara)

<p align="center">✨ Desenvolvido com amor 
por Seniamara Benedito ✨</p>```

