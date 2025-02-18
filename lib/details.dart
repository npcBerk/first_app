import 'package:first_app/states/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/*
Bu kodu artık manuel değil riverpod kullanarak üretiyoruz.
Riverpod kullanımı için ise states folderı altında provider.dart dosyası oluşturuyoruz.
Orada oluşturduğumuz kodları "flutter pub run build_runner build" komutu ile derliyoruz.
Bu da bize immutable kodlar üretir. Daha sonra bu kodları import ediyoruz.
*/
/*final postDetailsProvides =
    FutureProvider.family<PostModel, int>((ref, id) async {
  Dio dio = Dio();
  Response response =
      await dio.get("https://jsonplaceholder.typicode.com/posts/$id");
  //return response.data;
  //return PostModel.fromJson(response.data);//Hata alıyorum
  return PostModel.fromJson(response.data as Map<String, dynamic>);
});*/

class Details extends ConsumerWidget {
  final int id;

  const Details({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postAsyncValue = ref.watch(postDetailsProvider(id));

    return Scaffold(
        appBar: AppBar(
          title: Text('Details'),
        ),
        body: postAsyncValue.when(
          //FutureProvider'ın .when metodu ile data, loading, error kodlarını yazıyoruz.
          data: (data) => Column(
            children: [
              Text("Post ID: ${data.id}", style: const TextStyle(fontSize: 16)),
              Text("Başlık: ${data.title}",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              Text("İçerik : ${data.body}",
                  style: const TextStyle(fontSize: 14)),
            ],
          ),
          loading: () => const CircularProgressIndicator(),
          error: (error, stack) => Text(error.toString()),
        ));
  }
}
