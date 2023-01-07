import 'package:albin_abx/widgets/request_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../helpers/item_request.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

// Future<http.Response> fetchPost() {
//   return http.get('https://jsonplaceholder.typicode.com/posts');

// }
// void main() async {
//   final response = await fetchPost();
//   if (response.statusCode == 200) {
//     // La solicitud fue exitosa, procesa el cuerpo de la respuesta
//     print(response.body);
//   } else {
//     // La solicitud falló, maneja el error de acuerdo a tus necesidades
//     print("Error: ${response.statusCode}");
//   }
// }

  final req =
      const RequestItem(url: 'https://jsonplaceholder.typicode.com/posts');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // quitar el baneer
      home: Scaffold(
        appBar: AppBar(
          title: Text('Consumo de api'),
        ),
        body: Center(
          child: HTTPWidget(req),
        ),
      ),
    );
  }
}
