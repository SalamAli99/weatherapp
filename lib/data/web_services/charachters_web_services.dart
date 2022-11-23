// ignore_for_file: unused_element, avoid_print

import 'package:dio/dio.dart';
import 'package:weatherapp/constants/strings.dart';

class CharechtersWebServices {
  late Dio dio;

  CharechtersWebServices() {
    BaseOptions options = BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: 20 * 1000 //60 seconds

        ,
        receiveTimeout: 20 * 1000 //60 seconds

        );
    dio = Dio(options);
  }
  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('characters');
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
