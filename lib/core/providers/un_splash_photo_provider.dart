import 'package:get/get.dart';

class UnSplashPhotoProvider extends GetConnect {
  static const _apiUrl = 'https://api.unsplash.com';
  static const _apiKey = 'S6UGUweuM86oWf5g9bvcsAcqD4T5tY9S301D1o3N0Lg';
  static const _apiAuth = 'client_id=$_apiKey';

  // GET /search/photos
  Future<Response> getSearchPhotos(query, { page = 1}) {
    return get("$_apiUrl/search/photos?query=$query&$_apiAuth&page=$page");
  }
}




