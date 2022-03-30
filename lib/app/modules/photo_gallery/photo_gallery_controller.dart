import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/models/un_splash_photo_model.dart';
import '../../../core/providers/un_splash_photo_provider.dart';

class PhotoGalleryController extends GetxController {
  List<UnSplashResults>? images = [];
  bool loading = false;
  String message = '';
  String lastQuery = '';

  var lastPage= 0.obs;
  final UnSplashPhotoProvider _apiProvider = UnSplashPhotoProvider();
  final searchFormKey = GlobalKey<FormState>();
  final searchController = TextEditingController();


  @override
  void onInit() async{
    super.onInit();
    searchController.text = '';
  }

  Future<void> search() async {
    var query = searchController.text.trim();

    if (query.isEmpty) {
      Get.snackbar('Error', 'El campo de búsqueda está vacío', colorText: Colors.black, backgroundColor: Colors.amber);
    } else {
      lastPage++;
      lastQuery = query;
      images?.clear();
      loading = true;

      UnSplashPhotoModel unSplashPhotos;

      _apiProvider.getSearchPhotos(query).then((response) {
          unSplashPhotos = UnSplashPhotoModel.fromJson(json.decode(response.bodyString!));
          images = unSplashPhotos.results;
          loading = false;
          if (images!.isEmpty) {
            message = 'No hay resultados';
          } else {
            message = '';
          }
          update();
          Get.snackbar('OK', 'ok successfully', colorText: Colors.green);

        }, onError: (err) {
        Get.snackbar('ERROR', 'ERROR ERROR', colorText: Colors.white, backgroundColor: Colors.red);
      });
    }
  }

  Future<void> loadMore() async{
    lastPage++;

    UnSplashPhotoModel unSplashNewPhotos;
    _apiProvider.getSearchPhotos(lastQuery, page: lastPage).then((response) {
      unSplashNewPhotos = UnSplashPhotoModel.fromJson(json.decode(response.bodyString!));
      images?.addAll(unSplashNewPhotos.results);

      update();
      Get.snackbar('OK', 'ok successfully', colorText: Colors.green,);
    }, onError: (err) {
      Get.snackbar('ERROR', 'ERROR ERROR', colorText: Colors.white, backgroundColor: Colors.red);
    });
  }
}