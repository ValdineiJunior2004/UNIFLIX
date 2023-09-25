import 'dart:convert'; 
import '../model/filme.dart';
import 'package:http/http.dart' as http;

class FilmeApi{
 
    final String url =
    'https://my-json-server.typicode.com/ValdineiJunior2004/minha_API/filmes';
    Future<List<Filme>>getFilmes()async{
       final response =
        await http.get(Uri.parse(url));
    if(response.statusCode != 200){
      throw Exception('A API falhou!');
      
    }
    final json =jsonDecode(response.body);
      final mapsFilmes = json.cast<Map<String, dynamic>>();
 List<Filme> listFilmes = [];

      // Converte cada mapa de personagem em um objeto Personagem
      for (var map in mapsFilmes) {
        // Cria um objeto Personagem usando o método fromJson
        Filme objfilme = Filme.fromJson(map);
        // Adiciona o personagem à lista
        listFilmes.add(objfilme);
      }
      // Retorna a lista de personagens obtida da API
      return listFilmes;
    }
  }

  



// Definindo a classe FilmeApi
//class FilmeApi {
// Uma string que simula a resposta da API em formato JSON.
//String respostaApi =
    //  '''
    //[
     // {
       //   "id": 1,
         // "titulo": "Homem de Ferro 1",
          //"resumo":"Filme do Homem de Ferro",
          //"atores":"Robert Downey",
         // "capa":"https://roveran.files.wordpress.com/2017/11/iron-man-2-capa-min.jpg",
          //"duracao":140
      //},
      //{
        //  "id": 2,
          //"titulo": "Homem de Ferro 2",
          //"resumo":"Filme do Homem de Ferro 2",
          //"atores":"Robert Downey",
          //"capa":"https://roveran.files.wordpress.com/2017/11/iron-man-2-capa-min.jpg",
          //"duracao":120
      //}
    //]
   // ''';
  // Definindo um método assíncrono para buscar filmes offline.
  //Future<List<Filme>> getFilmesOffline() async {
    // Decodificando a string JSON para um objeto Dart.
    //final json = jsonDecode(respostaApi);

    // Convertendo os objetos JSON em List<Map<String, dynamic>>.
    //final mapsFilme = json.cast<Map<String, dynamic>>();

    // Criando uma lista vazia para armazenar os objetos Filme.
    //List<Filme> listFilmes = [];

    // Iterando por cada mapa de filme e convertendo em objetos Filme.
    //for (var map in mapsFilme) {
      //Filme filme = Filme.fromJson(map);
      //listFilmes.add(filme);
    //}

    // Delay simulado de 1 segundo (para simular o tempo de resposta da API).
    //await Future.delayed(const Duration(seconds: 1));

    // Retornando a lista de filmes após o processo.
    //return listFilmes;
  //}
//}
