import 'package:dio/dio.dart';
import 'package:first_app/models/post_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
Future<PostModel> postDetails(PostDetailsRef ref, int id) async {//PostDetailsRef sanırım artık kullanılmıyor.
  Dio dio = Dio();
  Response response =
      await dio.get("https://jsonplaceholder.typicode.com/posts/$id");
  return PostModel.fromJson(response.data as Map<String, dynamic>);
}
//Bu kodu yazdıktan sonra "flutter pub run build_runner build" komutu ile derliyoruz.
//Bu da bize immutable kodlar üretir(providers.g.dart dosyasını oluşturur). Daha sonra bu kodları import ediyoruz.
