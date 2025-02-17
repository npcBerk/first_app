import 'package:dio/dio.dart';
import 'package:first_app/models/post_model.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final int id;

  const Details({super.key, required this.id});

  Future<PostModel> getDetails(id) async {
    Dio dio = Dio();
    Response? response;
    try {
      response =
          await dio.get("https://jsonplaceholder.typicode.com/posts/${id}");
    } catch (e) {
      print("Error");
    }
    return PostModel.fromJson(response!.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: FutureBuilder<PostModel>(
        future: getDetails(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(); // Yükleniyor animasyonu göster
          } else if (snapshot.hasError || snapshot.data == null) {
            return const Text("Veri alınamadı!");
          } else {
            //return Text(snapshot.data ?? "Veri alınamadı");
            final details = snapshot.data!;
            return Column(
              children: [
                Text("Post ID: ${details.id}",
                    style: const TextStyle(fontSize: 16)),
                Text("Başlık: ${details.title}",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text("İçerik: ${details.body}",
                    style: const TextStyle(fontSize: 14)),
              ],
            );
          }
        },
      ),
    );
  }
}
